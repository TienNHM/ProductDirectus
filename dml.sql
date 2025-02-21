CREATE TABLE "brands" (
    `sap_id` varchar(255) NOT NULL,
    `name` varchar(255) NULL,
    `name_sap` varchar(255) NOT NULL DEFAULT null,
    `is_brand` boolean NULL DEFAULT '1',
    `category` varchar(255) NULL,
    `positioning` varchar(255) NULL DEFAULT null,
    `reporting_group` varchar(255) NULL DEFAULT null,
    `status` varchar(255) NOT NULL DEFAULT 'draft',
    `is_mono_website` boolean NULL DEFAULT '0',
    `is_multi_website` boolean NULL DEFAULT '0',
    `is_mono_offline` boolean NULL DEFAULT '0',
    `sales_channel` varchar(255) NULL,
    `merchandise_source` varchar(255) NULL DEFAULT null,
    `launch_year` integer NULL,
    `close_year` integer NULL DEFAULT null,
    `close_reason` text NULL,
    `mono_website_url` varchar(255) NULL,
    `multi_website_url` varchar(255) NULL DEFAULT null,
    `corporate_website_url` varchar(255) NULL DEFAULT null,
    `short_description_vn` text NULL,
    `long_description_vn` text NULL DEFAULT null,
    `long_description_en` text NULL DEFAULT null,
    `short_description_en` text NULL DEFAULT null,
    `fb_subcategory_1` varchar(255) NULL,
    `fb_subcategory_2` varchar(255) NULL DEFAULT null,
    `fb_subcategory_3` varchar(255) NULL DEFAULT null,
    `fb_price_range` varchar(255) NULL DEFAULT null,
    PRIMARY KEY (`sap_id`)
)

CREATE TABLE "countries" (
    `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    `name` varchar(255) NULL,
    `country_code` integer NULL,
    `country_iso` varchar(2) null,
    `name_en` varchar(255) null default null,
    `full_name` varchar(255) null default null,
    `full_name_en` varchar(255) null default null
)

CREATE TABLE "districts" (
    `id` varchar(255) NOT NULL,
    `name` varchar(255) NULL,
    `province_id` integer NULL,
    `name_en` varchar(255) NULL DEFAULT null,
    `sort_number` integer NULL,
    `postal_code` integer NULL,
    `name_meta` varchar(255) null,
    PRIMARY KEY (`id`),
    CONSTRAINT `districts_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE
    SET NULL
)

CREATE TABLE "locations" (
    `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    `name` varchar(255) NULL,
    `name_en` varchar(255) NULL DEFAULT null,
    `full_name` varchar(255) NULL DEFAULT null,
    `full_name_en` varchar(255) NULL DEFAULT null,
    `premise_type` varchar(255) NULL,
    `district_id` varchar(255) NULL,
    `grade` varchar(255) null,
    `location_group` varchar(255) null,
    `is_cbd` boolean null default '0',
    CONSTRAINT `locations_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE
    SET NULL
)

CREATE TABLE "provinces" (
    `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    `name` varchar(255) NULL,
    `name_google` varchar(255) NULL,
    `sort_number` integer,
    `postal_code` integer DEFAULT null,
    `is_city` boolean NULL DEFAULT '0',
    `region_id` integer NULL,
    `name_en` varchar(255) NULL DEFAULT null,
    `province_code` varchar(3) NULL,
    CONSTRAINT `provinces_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE
    SET NULL
)

CREATE TABLE "regions" (
    `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    `country_id` integer NOT NULL DEFAULT null,
    `name` varchar(255) NOT NULL DEFAULT null,
    `name_en` varchar(255) not null default null,
    CONSTRAINT `regions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE `stores` (
    `sap_id` varchar(255) not null,
    `status` varchar(255) not null default 'draft',
    primary key (`sap_id`)
)
