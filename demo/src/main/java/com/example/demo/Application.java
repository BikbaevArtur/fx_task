package com.example.demo;

import javafx.beans.property.SimpleFloatProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Application {
    private final SimpleIntegerProperty num;
    private final SimpleStringProperty cofinder;
    private final SimpleStringProperty vacancy;
    private final SimpleStringProperty status;
    private final SimpleStringProperty data_end;
    private final SimpleStringProperty recruiter;
    private final SimpleFloatProperty price;

    public Application(int num, String cofinder, String vacancy, String status, String data_end, float price, String recruiter) {
        this.num = new SimpleIntegerProperty(num);
        this.cofinder = new SimpleStringProperty(cofinder);
        this.vacancy = new SimpleStringProperty(vacancy);
        this.status = new SimpleStringProperty(status);
        this.data_end = new SimpleStringProperty(data_end);
        this.price = new SimpleFloatProperty(price);
        this.recruiter = new SimpleStringProperty(recruiter);
    }

    public int getNum() {
        return num.get();
    }

    public void setNum(int num) {
        this.num.set(num);
    }

    public SimpleIntegerProperty numProperty() {
        return num;
    }

    public String getCofinder() {
        return cofinder.get();
    }

    public void setCofinder(String cofinder) {
        this.cofinder.set(cofinder);
    }

    public SimpleStringProperty cofinderProperty() {
        return cofinder;
    }

    public String getVacancy() {
        return vacancy.get();
    }

    public void setWVacancy(String workgiver) {
        this.vacancy.set(workgiver);
    }

    public SimpleStringProperty vacancyProperty() {
        return vacancy;
    }

    public String getStatus() {
        return status.get();
    }

    public void setStatus(String status) {
        this.status.set(status);
    }

    public SimpleStringProperty statusProperty() {
        return status;
    }

    public String getData_end() {
        return data_end.get();
    }

    public void setData_end(String data_end) {
        this.data_end.set(data_end);
    }

    public SimpleStringProperty data_endProperty() {
        return data_end;
    }

    public float getPrice() {
        return price.get();
    }

    public void setPrice(float price) {
        this.price.set(price);
    }

    public SimpleFloatProperty priceProperty() {
        return price;
    }

    public String getRecruiter() {
        return recruiter.get();
    }

    public void setRecruiter(String recruiter) {
        this.recruiter.set(recruiter);
    }

    public SimpleStringProperty recruiterProperty() {
        return recruiter;
    }
}
