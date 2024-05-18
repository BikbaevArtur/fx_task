module com.example.demo {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.desktop;
    requires java.sql;
    requires static lombok;


    opens com.example.demo to javafx.fxml;
    exports com.example.demo;
    exports com.example.demo.model;
    exports com.example.demo.model.entyty;
    opens com.example.demo.model to javafx.fxml;
    exports com.example.demo.data;
    opens com.example.demo.data to javafx.fxml;
}