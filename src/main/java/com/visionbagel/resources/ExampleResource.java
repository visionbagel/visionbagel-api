package com.visionbagel.resources;

import com.alipay.api.AlipayApiException;
import com.visionbagel.entitys.Example;
import com.visionbagel.entitys.History;
import com.visionbagel.entitys.User;
import com.visionbagel.payload.PageParams;
import com.visionbagel.payload.ResultOfPaging;
import com.visionbagel.repositorys.ExampleRepository;
import com.visionbagel.repositorys.HistoryRepository;
import com.visionbagel.repositorys.UserRepository;
import com.visionbagel.utils.MediaTools;
import io.quarkus.panache.common.Sort;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.OpenAPIDefinition;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.enums.SchemaType;
import org.eclipse.microprofile.openapi.annotations.info.Contact;
import org.eclipse.microprofile.openapi.annotations.info.Info;
import org.eclipse.microprofile.openapi.annotations.info.License;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.media.SchemaProperty;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;
import org.jboss.resteasy.api.validation.ViolationReport;

import java.io.IOException;
import java.io.InputStream;

@OpenAPIDefinition(
    tags = {
        @Tag(name="widget", description="Widget operations."),
        @Tag(name="gasket", description="Operations related to gaskets")
    },
    info = @Info(
        title="Example API",
        version = "1.0.1",
        contact = @Contact(
            name = "Example API Support",
            url = "http://exampleurl.com/contact",
            email = "techsupport@example.com"),
        license = @License(
            name = "Apache 2.0",
            url = "https://www.apache.org/licenses/LICENSE-2.0.html"))
)
@Path("/example")
public class ExampleResource {

    @Inject
    public ExampleRepository exampleRepository;


    @Inject
    public HistoryRepository historyRepository;

    @Inject
    public UserRepository userRepository;

    @Tag(name = "Hello", description = "Operations related to gaskets")
    @Operation(summary = "Update an existing pet")
    @APIResponse(
        responseCode = "200",
        description = "Example List",
        content = @Content(
            mediaType = "application/json",
            schema = @Schema(
                implementation = ResultOfPaging.class,
                properties = {
                    @SchemaProperty(name = "records", type = SchemaType.ARRAY, implementation = Example.class),
                }
            )
        )
    )
    @APIResponse(
        responseCode = "400",
        description = "User not found",
        content = @Content(
            mediaType = "application/json",
            schema = @Schema(
                implementation = ViolationReport.class
            )
        )
    )
    @GET()
    @Transactional
    @Produces(MediaType.APPLICATION_JSON)
    public Response hello(@BeanParam Example params, @BeanParam PageParams pageParams) throws AlipayApiException, IOException {

        User user = userRepository.findAll().list().getFirst();
        return Response
            .status(200)
            .entity(
                new ResultOfPaging<>(
                    History.find("user", Sort.by("whenCreated"), user),
                    PageParams.of(pageParams)
                )
            )
            .build();
    }
}
