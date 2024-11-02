package com.visionbagel.repositorys;


import com.visionbagel.entitys.User;
import com.visionbagel.payload.LoginBody;
import com.visionbagel.payload.RegisterBody;
import com.visionbagel.utils.GenerateViolationReport;
import com.visionbagel.utils.SecurityTools;
import com.visionbagel.utils.TokenTools;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import org.jboss.resteasy.api.validation.ConstraintType;
import org.jboss.resteasy.api.validation.ResteasyConstraintViolation;
import org.jboss.resteasy.api.validation.ViolationReport;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class SessionRepository extends RepositoryBase<User> {
    private ViolationReport violationReport;

    @Inject
    SecurityTools securityTools;
    @Inject
    TokenTools tokenTools;

    @Transactional
    public User create(RegisterBody registerBody) {
        User user = new User();
        user.username = registerBody.username;
        user.sex = registerBody.sex;
        user.password = securityTools.generatePassword(registerBody.password);

        user.persistAndFlush();

        ViolationReport violationReport = new ViolationReport();
        ArrayList<ResteasyConstraintViolation> list = new ArrayList<>(){{
            add(new ResteasyConstraintViolation());
        }};
        violationReport.setPropertyViolations(list);

        return user;
    }

    public boolean validOfRegister(RegisterBody registerBody) {
        long count = User.find("username", registerBody.username).count();
        if(count == 0) {
            return true;
        } else {
            GenerateViolationReport generateViolationReport = new GenerateViolationReport();
            generateViolationReport.add(
                new ResteasyConstraintViolation(
                    ConstraintType.Type.PARAMETER, "username", "用户名已经存在", registerBody.username
                )
            );
            this.violationReport = generateViolationReport.build();
            return false;
        }
    }

    @Transactional
    public User login(LoginBody loginBody) {
        Optional<User> user = User.find("username", loginBody.account).firstResultOptional();
        if(user.isEmpty()) {
            user = User.find("email", loginBody.account).firstResultOptional();
        }
        if(user.isPresent()) {
            if(securityTools.matches(loginBody.password, user.get().password)) {
                User authUser = user.get();
                tokenTools.generate(authUser, List.of("User"));
                return authUser;
            }
        }
        return null;
    }

    public ViolationReport getViolationReport() {
        return violationReport;
    }
}