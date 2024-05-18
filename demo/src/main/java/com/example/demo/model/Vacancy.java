package com.example.demo.model;

import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.property.SimpleFloatProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Vacancy {

    private SimpleIntegerProperty num; //0
    private SimpleStringProperty name;//1
    private SimpleStringProperty desc;//2
    private SimpleStringProperty stricts;//3
    private SimpleStringProperty type;//4
    private SimpleStringProperty vid;//5
    private SimpleFloatProperty sum;//6
    private SimpleBooleanProperty payed;//7

    public Vacancy() {
    }

    /**
     *
     * @param name наименование вакансии
     * @param desc описание вакансии
     * @param stricts требование к соискателю
     * @param type тип занятости
     * @param vid вид деятельности
     * @param sum сумма на оплату
     * @param payed оплачена ли вакансии
     */
    public Vacancy( String name, String desc, String stricts, String type, String vid, float sum, boolean payed) {
        this.num = new SimpleIntegerProperty();
        this.name = new SimpleStringProperty(name);
        this.desc = new SimpleStringProperty(desc);
        this.stricts = new SimpleStringProperty(stricts);
        this.type = new SimpleStringProperty(type);
        this.vid = new SimpleStringProperty(vid);
        this.sum = new SimpleFloatProperty(sum);
        this.payed = new SimpleBooleanProperty(payed);
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

    public String getName() {
        return name.get();
    }

    public void setName(String name) {
        this.name.set(name);
    }

    public SimpleStringProperty nameProperty() {
        return name;
    }

    public String getDesc() {
        return desc.get();
    }

    public void setDesc(String desc) {
        this.desc.set(desc);
    }

    public SimpleStringProperty descProperty() {
        return desc;
    }

    public String getType() {
        return type.get();
    }

    public void setType(String type) {
        this.type.set(type);
    }

    public SimpleStringProperty typeProperty() {
        return type;
    }

    public String getVid() {
        return vid.get();
    }

    public void setVid(String vid) {
        this.vid.set(vid);
    }

    public SimpleStringProperty vidProperty() {
        return vid;
    }

    public float getSum() {
        return sum.get();
    }

    public void setSum(float sum) {
        this.sum.set(sum);
    }

    public SimpleFloatProperty sumProperty() {
        return sum;
    }

    public String getStricts() {
        return stricts.get();
    }

    public void setStricts(String stricts) {
        this.stricts.set(stricts);
    }

    public SimpleStringProperty strictsProperty() {
        return stricts;
    }

    public boolean isPayed() {
        return payed.get();
    }

    public void setPayed(boolean payed) {
        this.payed.set(payed);
    }

    public SimpleBooleanProperty payedProperty() {
        return payed;
    }


    @Override
    public String toString() {
        return "Vacancy{" +
                "num=" + num +
                ", name=" + name +
                ", desc=" + desc +
                ", stricts=" + stricts +
                ", type=" + type +
                ", vid=" + vid +
                ", sum=" + sum +
                ", payed=" + payed +
                '}';
    }
}
