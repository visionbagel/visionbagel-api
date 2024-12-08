-- This file allow to write SQL commands that will be emitted in test and dev.
-- The commands are commented as their support depends of the database
-- insert into myentity (id, field) values(1, 'field-1');
-- insert into myentity (id, field) values(2, 'field-2');
-- insert into myentity (id, field) values(3, 'field-3');
-- alter sequence myentity_seq restart with 4;

INSERT INTO public."user" (sex, when_created, when_deleted, when_modified, id, phone_number, username, avatar, password, role) VALUES (null, '2024-05-04 10:38:01.699416 +00:00', null, '2024-05-04 10:38:01.699467 +00:00', '36e149e3-ed38-42ef-83ca-fad1f9f10303', '16631132230', '16631132230', null, '$2a$10$q7ItLTa4RRHMjlYeUw98Bejt3CzQNW17lGmpx/.k3FoFXWZKpcKpG', null);
INSERT INTO "public"."user_token" ("when_created", "when_deleted", "when_modified", "id", "user_id", "token") VALUES (NULL, NULL, NULL, '36e149e3-ed38-42ef-83ca-fad1f9910503', '36e149e3-ed38-42ef-83ca-fad1f9f10303', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Zpc2lvbmJhZ2VsLmNvbSIsInVwbiI6Im9wZW5zcG9uc29yIiwiZ3JvdXBzIjpbIlVzZXIiXSwiYmlydGhkYXRlIjoiMjAyNS0xMC0yOSIsImlhdCI6MTczMDIwMTAyNCwiZXhwIjoxNzMyNzkzMDI0LCJqdGkiOiIxY2NlZGNhOS1mODU3LTRlNzQtYjNlMy05MTlmM2VmNmE5OTkifQ.HsAJcjgU75m4oviayTOFMgSnKAnyozxy7rHzChMebqe3FIi_7yBAhPAcF2WMXfB-IjjDXQlfprhKVzFOYyV3QOUy_dLrfQLD-Nhr0QUhFYKm0w9dqtkoIbNxeMGIufTxLsNaKiue__UAejFjIphoJ7HzZayBonI0h2bESU0Wsl_BVBrT407m_lZ3Q7CC2fUOxHueQBpCSfRKUR5eKfMRcX8hf0nGvPrywMG40zwEkJVFLZmUYYLr1KRGdd3JevZcpWCFE42wEFQn_vEkqYtNBNWXgLy6GAB7-8JkwKeRXRuhlghsJkQBsdRgMAD3ZM6HmkgyClT5D7ke8mQDrcSKgg');

INSERT INTO "public"."wallet" ("balance", "when_created", "when_deleted", "when_modified", "id", "user_id") VALUES (1, '2024-11-02 16:55:30.397166+08', NULL, '2024-11-02 16:55:30.397189+08', 'f850bc51-36c5-4a50-8a69-f4e9bc952d65', '36e149e3-ed38-42ef-83ca-fad1f9f10303');

-- gen history
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-04 18:06:02.455234+08', NULL, '2024-11-04 18:06:02.455239+08', '5f74dc34-d9f9-4da5-b8cb-ae6beef2212e', '36e149e3-ed38-42ef-83ca-fad1f9f10303', 'c43ed5ed-78e1-45a9-a0b0-3ca0a06c6142', 'the black cat on table.');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-04 18:06:38.067484+08', NULL, '2024-11-04 18:06:38.067492+08', '453b8a78-11ce-42ab-a76c-7e7ac59966e3', '36e149e3-ed38-42ef-83ca-fad1f9f10303', '314a3157-c6c3-40e0-be66-d6d737aea600', 'the black cat on table.');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-04 19:05:56.156986+08', NULL, '2024-11-04 19:05:56.156992+08', 'fdfdfc85-06d1-4a84-8b81-a0e45ee59d47', '36e149e3-ed38-42ef-83ca-fad1f9f10303', '36be546a-9c17-4c48-8fde-0f8e7a462dd6', 'the black cat on table.');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-04 19:06:28.077001+08', NULL, '2024-11-04 19:06:28.077006+08', '0e5affe3-2df4-4fcb-b529-7904d894e1d3', '36e149e3-ed38-42ef-83ca-fad1f9f10303', 'f462d25b-17f5-415c-8e4b-f6c108c062b8', 'the black cat on table.');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-25 11:18:51.451721+08', NULL, '2024-11-25 11:18:51.451731+08', '03600c89-6c0c-419f-adac-524d8d6896f1', '36e149e3-ed38-42ef-83ca-fad1f9f10303', '8ec989c8-bfe1-4a31-9ac8-4ac462980ea6', '一只猫在桌子上趴着, 背景是开放式厨房和绿植');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-25 11:20:38.445007+08', NULL, '2024-11-25 11:20:38.445015+08', '1a00340d-f0ef-4f8f-bb75-7272b47e137a', '36e149e3-ed38-42ef-83ca-fad1f9f10303', 'b14e58cc-7ecf-413d-9cae-042b2f312d67', '一只美国短毛猫在桌子上趴着, 脚在桌子边缘, 背景是开放式厨房和绿植');
INSERT INTO "public"."history" ("when_created", "when_deleted", "when_modified", "id", "user_id", "request_id", "prompt") VALUES ('2024-11-25 11:22:28.415587+08', NULL, '2024-11-25 11:22:28.415595+08', '03cef320-7744-4008-8f27-f742d6f53556', '36e149e3-ed38-42ef-83ca-fad1f9f10303', 'a2bf853b-a7d2-4476-9a39-6e7bb5ef15e5', '一只美国短毛猫在桌子上趴着, 脚在桌子边缘, 背景是开放式厨房和绿植, 卡通风格, 4k, 高质量');

-- sms
INSERT INTO "public"."sms_code" ("code", "effective", "when_created", "when_deleted", "when_modified", "mobile", "id") VALUES ('1031', 't', '2024-11-12 16:13:04.195817+08', NULL, '2024-11-12 16:13:04.195827+08', '16631132230', '22ee50b8-d247-4424-98aa-20aced67d85d');


-- trade
INSERT INTO "public"."trade" ("money", "pay_status", "when_created", "when_deleted", "when_modified", "id", "user_id", "trade_no") VALUES ('1.00', 'f', '2024-11-15 14:52:53.950117+08', NULL, '2024-11-15 14:52:53.950142+08', '82550604-c50c-46ea-8b73-14a407e5ad1a', NULL, '20241115865683000');
