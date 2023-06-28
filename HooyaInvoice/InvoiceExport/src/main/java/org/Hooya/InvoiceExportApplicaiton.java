package org.Hooya;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.Hooya.mapper")
public class InvoiceExportApplicaiton {
    public static void main(String[] args) {
        SpringApplication.run(InvoiceExportApplicaiton.class);
    }
}
