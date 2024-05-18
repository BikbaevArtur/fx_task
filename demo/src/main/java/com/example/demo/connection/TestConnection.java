package com.example.demo.connection;

import java.sql.*;

public class TestConnection extends Config {
    static Connection connection;

    public static Connection GetConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username,password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
