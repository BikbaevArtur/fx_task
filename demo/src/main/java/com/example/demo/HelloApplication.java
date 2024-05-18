package com.example.demo;

import com.example.demo.data.Requests;
import com.example.demo.model.Vacancy;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class HelloApplication extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("hello-view.fxml"));
        Scene scene = new Scene(fxmlLoader.load());

        stage.setTitle("Карьерный Навигатор");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) throws SQLException {

        Requests requests = new Requests();
        List<Vacancy> vacancies = requests.getAppOnVac();
        vacancies.forEach(System.out::println);

      launch();

    }
}