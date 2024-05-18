package com.example.demo.data;

import com.example.demo.connection.TestConnection;
import com.example.demo.model.Resume;
import com.example.demo.model.VacancySimplePropertyMapper;
import com.example.demo.model.entyty.Messenger;
import com.example.demo.model.entyty.Passport;
import com.example.demo.model.entyty.Rekruter;
import com.example.demo.model.entyty.Soiskatel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Requests {


    public List<VacancySimplePropertyMapper> getAppOnVac() {

        List<VacancySimplePropertyMapper> vacancyList = new ArrayList<>();
        String sql = "";

        try (Connection connection = TestConnection.GetConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                VacancySimplePropertyMapper vacancy = new VacancySimplePropertyMapper();
                vacancyList.add(vacancy);
            }


        } catch (SQLException exception) {
            exception.getStackTrace();
        }
        return vacancyList;

    }


    public List<Resume> getAllResume() {
        List<Resume> resumeList = new ArrayList<>();
        String sql = "select * from soiskatel ";

        try (Connection connection = TestConnection.GetConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {


                Soiskatel soiskatel = new Soiskatel(
                        resultSet.getInt("soiskatelID"),
                        resultSet.getString("surname"),
                        resultSet.getString("lastname"),
                        resultSet.getString("name"),
                        resultSet.getDate("dateOfBirth").toLocalDate(),
                        resultSet.getInt("passportID"),
                        resultSet.getString("workExperience"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getInt("messengerID"),
                        resultSet.getInt("userID"),
                        resultSet.getInt("typeOfDocumentsID"));


                Passport passport = findPassportById(soiskatel.getPassportID());
                Messenger messenger = findMessengerById(soiskatel.getMessengerID());


                Resume resume = new Resume(
                        soiskatel.getSurname(),
                        soiskatel.getLastname(),
                        soiskatel.getName(),
                        soiskatel.getDateOfBirth(),
                        passport,
                        soiskatel.getWorkExperience(),
                        soiskatel.getPhoneNumber(),
                        messenger,
                        new Rekruter() //заглушка
                );

                resumeList.add(resume);
            }


        } catch (SQLException exception) {
            exception.getStackTrace();
        }
        return resumeList;
    }

    public Passport findPassportById(int id) {
        Passport passport = new Passport();
        String sql = "select * from passport where passportID = ? )";
        try (Connection connection = TestConnection.GetConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                passport.setPassportID(resultSet.getInt("passportId"));
                passport.setSeries(resultSet.getString("series"));
                passport.setNumber(resultSet.getString("number"));
                passport.setIssuedBy(resultSet.getString("issuedBy"));
                passport.setDateOfIssue(resultSet.getDate("dateOfIssue").toLocalDate());
                passport.setDepartmentCode(resultSet.getString("departmentCode"));

            }

        } catch (SQLException exception) {
            exception.getStackTrace();
        }
        return passport;

    }

    public Messenger findMessengerById(int id) {
        Messenger messenger = new Messenger();
        String sql = "select * from  messenger where id =?";
        try (Connection connection = TestConnection.GetConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                messenger.setMessengerID(resultSet.getInt("messengerID"));//
                messenger.setNameMessenger(resultSet.getString("nameMessenger"));//

            }

        } catch (SQLException exception) {
            exception.getStackTrace();
        }
        return messenger;
    }
}
