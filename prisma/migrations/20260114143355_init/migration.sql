-- CreateTable
CREATE TABLE `employee` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `profile_photo` VARCHAR(191) NULL,
    `brith_date` DATETIME(3) NULL,
    `city` VARCHAR(191) NULL,
    `hire_date` DATETIME(3) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `employee_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `employee_id` BIGINT NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password_hash` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `last_login_at` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `users_employee_id_key`(`employee_id`),
    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vacation` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `employee_id` BIGINT NOT NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `approved_by` BIGINT NULL,
    `approved_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clients` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `short_name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `website` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `clients_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_contact` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `position` VARCHAR(191) NULL,
    `is_primary_contact` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `assets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT NOT NULL,
    `asset_type` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `infrastructure` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `asset_id` BIGINT NOT NULL,
    `ip_address` VARCHAR(191) NULL,
    `management_url` VARCHAR(191) NULL,
    `access_protocol` VARCHAR(191) NULL,
    `access_port` INTEGER NULL,
    `location` VARCHAR(191) NULL,
    `connected_description` VARCHAR(191) NULL,
    `notes` VARCHAR(191) NULL,

    UNIQUE INDEX `infrastructure_asset_id_key`(`asset_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `server` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `asset_id` BIGINT NOT NULL,
    `cpu_model` VARCHAR(191) NULL,
    `cpu_cores` INTEGER NULL,
    `cpu_threads` INTEGER NULL,
    `ram_gb` INTEGER NULL,
    `ram_type` VARCHAR(191) NULL,
    `ram_slots_total` INTEGER NULL,
    `ram_slots_used` INTEGER NULL,
    `motherboard` VARCHAR(191) NULL,
    `bios_version` VARCHAR(191) NULL,
    `architecture` VARCHAR(191) NULL,
    `storage_controller` VARCHAR(191) NULL,
    `raid_level` VARCHAR(191) NULL,
    `total_storage_gb` INTEGER NULL,
    `networkIntefaces` INTEGER NULL,
    `primary_mac` VARCHAR(191) NULL,
    `secondary_mac` VARCHAR(191) NULL,
    `os_name` VARCHAR(191) NULL,
    `os_version` VARCHAR(191) NULL,
    `virtualization` VARCHAR(191) NULL,
    `is_virtual` BOOLEAN NOT NULL,
    `serial_number` VARCHAR(191) NULL,
    `nabyfactyrer` VARCHAR(191) NULL,
    `model` VARCHAR(191) NULL,
    `purchase_date` DATETIME(3) NULL,
    `warranty_end` DATETIME(3) NULL,

    UNIQUE INDEX `server_asset_id_key`(`asset_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hd` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `server_id` BIGINT NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `capacity_gb` INTEGER NOT NULL,
    `interface` VARCHAR(191) NOT NULL,
    `serial_number` VARCHAR(191) NULL,
    `slot` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `backup` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hd_id` BIGINT NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `executed_at` DATETIME(3) NOT NULL,
    `last_run_at` DATETIME(3) NOT NULL,
    `next_run_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `software` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT NOT NULL,
    `infrastructure_id` BIGINT NULL,
    `name` VARCHAR(191) NOT NULL,
    `access_ip` VARCHAR(191) NULL,
    `port` INTEGER NULL,
    `url` VARCHAR(191) NULL,
    `version` VARCHAR(191) NULL,
    `environment` VARCHAR(191) NULL,
    `notes` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `external_service` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `contact_id` BIGINT NOT NULL,
    `scheduled_date` DATETIME(3) NOT NULL,
    `service_date` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `os_scan` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,
    `contact_id` BIGINT NOT NULL,
    `service_date` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `reason` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lab_maintenance` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `asset_id` BIGINT NOT NULL,
    `client_id` BIGINT NOT NULL,
    `contact_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `problem_description` VARCHAR(191) NULL,
    `service_description` VARCHAR(191) NULL,
    `received_at` DATETIME(3) NOT NULL,
    `exit_at` DATETIME(3) NULL,
    `returned_at` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `holidays` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `is_national` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EmployeeToRole` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_EmployeeToRole_AB_unique`(`A`, `B`),
    INDEX `_EmployeeToRole_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EmployeeToService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_EmployeeToService_AB_unique`(`A`, `B`),
    INDEX `_EmployeeToService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EmployeeToExternalService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_EmployeeToExternalService_AB_unique`(`A`, `B`),
    INDEX `_EmployeeToExternalService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EmployeeToLabMaintenance` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_EmployeeToLabMaintenance_AB_unique`(`A`, `B`),
    INDEX `_EmployeeToLabMaintenance_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_RoleToService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_RoleToService_AB_unique`(`A`, `B`),
    INDEX `_RoleToService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientsToService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientsToService_AB_unique`(`A`, `B`),
    INDEX `_ClientsToService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientsToExternalService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientsToExternalService_AB_unique`(`A`, `B`),
    INDEX `_ClientsToExternalService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientsToLabMaintenance` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientsToLabMaintenance_AB_unique`(`A`, `B`),
    INDEX `_ClientsToLabMaintenance_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientContactToService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientContactToService_AB_unique`(`A`, `B`),
    INDEX `_ClientContactToService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientContactToExternalService` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientContactToExternalService_AB_unique`(`A`, `B`),
    INDEX `_ClientContactToExternalService_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ClientContactToLabMaintenance` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ClientContactToLabMaintenance_AB_unique`(`A`, `B`),
    INDEX `_ClientContactToLabMaintenance_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_AssetToLabMaintenance` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_AssetToLabMaintenance_AB_unique`(`A`, `B`),
    INDEX `_AssetToLabMaintenance_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `vacation` ADD CONSTRAINT `vacation_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `vacation` ADD CONSTRAINT `vacation_approved_by_fkey` FOREIGN KEY (`approved_by`) REFERENCES `employee`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client_contact` ADD CONSTRAINT `client_contact_client_id_fkey` FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `assets` ADD CONSTRAINT `assets_client_id_fkey` FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `infrastructure` ADD CONSTRAINT `infrastructure_asset_id_fkey` FOREIGN KEY (`asset_id`) REFERENCES `assets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `server` ADD CONSTRAINT `server_asset_id_fkey` FOREIGN KEY (`asset_id`) REFERENCES `assets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `hd` ADD CONSTRAINT `hd_server_id_fkey` FOREIGN KEY (`server_id`) REFERENCES `server`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `backup` ADD CONSTRAINT `backup_hd_id_fkey` FOREIGN KEY (`hd_id`) REFERENCES `hd`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `software` ADD CONSTRAINT `software_client_id_fkey` FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `software` ADD CONSTRAINT `software_infrastructure_id_fkey` FOREIGN KEY (`infrastructure_id`) REFERENCES `infrastructure`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToRole` ADD CONSTRAINT `_EmployeeToRole_A_fkey` FOREIGN KEY (`A`) REFERENCES `employee`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToRole` ADD CONSTRAINT `_EmployeeToRole_B_fkey` FOREIGN KEY (`B`) REFERENCES `role`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToService` ADD CONSTRAINT `_EmployeeToService_A_fkey` FOREIGN KEY (`A`) REFERENCES `employee`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToService` ADD CONSTRAINT `_EmployeeToService_B_fkey` FOREIGN KEY (`B`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToExternalService` ADD CONSTRAINT `_EmployeeToExternalService_A_fkey` FOREIGN KEY (`A`) REFERENCES `employee`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToExternalService` ADD CONSTRAINT `_EmployeeToExternalService_B_fkey` FOREIGN KEY (`B`) REFERENCES `external_service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToLabMaintenance` ADD CONSTRAINT `_EmployeeToLabMaintenance_A_fkey` FOREIGN KEY (`A`) REFERENCES `employee`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeToLabMaintenance` ADD CONSTRAINT `_EmployeeToLabMaintenance_B_fkey` FOREIGN KEY (`B`) REFERENCES `lab_maintenance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RoleToService` ADD CONSTRAINT `_RoleToService_A_fkey` FOREIGN KEY (`A`) REFERENCES `role`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RoleToService` ADD CONSTRAINT `_RoleToService_B_fkey` FOREIGN KEY (`B`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToService` ADD CONSTRAINT `_ClientsToService_A_fkey` FOREIGN KEY (`A`) REFERENCES `clients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToService` ADD CONSTRAINT `_ClientsToService_B_fkey` FOREIGN KEY (`B`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToExternalService` ADD CONSTRAINT `_ClientsToExternalService_A_fkey` FOREIGN KEY (`A`) REFERENCES `clients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToExternalService` ADD CONSTRAINT `_ClientsToExternalService_B_fkey` FOREIGN KEY (`B`) REFERENCES `external_service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToLabMaintenance` ADD CONSTRAINT `_ClientsToLabMaintenance_A_fkey` FOREIGN KEY (`A`) REFERENCES `clients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientsToLabMaintenance` ADD CONSTRAINT `_ClientsToLabMaintenance_B_fkey` FOREIGN KEY (`B`) REFERENCES `lab_maintenance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToService` ADD CONSTRAINT `_ClientContactToService_A_fkey` FOREIGN KEY (`A`) REFERENCES `client_contact`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToService` ADD CONSTRAINT `_ClientContactToService_B_fkey` FOREIGN KEY (`B`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToExternalService` ADD CONSTRAINT `_ClientContactToExternalService_A_fkey` FOREIGN KEY (`A`) REFERENCES `client_contact`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToExternalService` ADD CONSTRAINT `_ClientContactToExternalService_B_fkey` FOREIGN KEY (`B`) REFERENCES `external_service`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToLabMaintenance` ADD CONSTRAINT `_ClientContactToLabMaintenance_A_fkey` FOREIGN KEY (`A`) REFERENCES `client_contact`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ClientContactToLabMaintenance` ADD CONSTRAINT `_ClientContactToLabMaintenance_B_fkey` FOREIGN KEY (`B`) REFERENCES `lab_maintenance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AssetToLabMaintenance` ADD CONSTRAINT `_AssetToLabMaintenance_A_fkey` FOREIGN KEY (`A`) REFERENCES `assets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AssetToLabMaintenance` ADD CONSTRAINT `_AssetToLabMaintenance_B_fkey` FOREIGN KEY (`B`) REFERENCES `lab_maintenance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
