package com.example.demo.data;

import com.example.demo.connection.TestConnection;
import com.example.demo.model.Vacancy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Requests {


   public List<Vacancy> getAppOnVac()  {

        List<Vacancy> vacancyList = new ArrayList<>();
        String sql = "";

        try (Connection connection = TestConnection.GetConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Vacancy vacancy = new Vacancy();
                vacancyList.add(vacancy);
            }


        } catch (SQLException exception) {
            exception.getStackTrace();
        }
        return vacancyList;

    }
}
