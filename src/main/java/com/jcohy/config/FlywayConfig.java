package com.jcohy.config;

import org.flywaydb.core.Flyway;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.stereotype.Component;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/29 10:26.
 * ClassName  : FlywayConfig
 * Description  :
 */

@Component
public class FlywayConfig implements FlywayMigrationStrategy {

        @Override
        public void migrate(Flyway flyway) {
            flyway.setBaselineOnMigrate(true);
            flyway.migrate();
        }

    }

