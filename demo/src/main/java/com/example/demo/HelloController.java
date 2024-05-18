package com.example.demo;

import com.example.demo.data.Requests;
import com.example.demo.model.Application;
import com.example.demo.model.VacancySimplePropertyMapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.Pane;
import javafx.util.StringConverter;

import java.sql.SQLException;
import java.util.List;
import java.util.function.UnaryOperator;
import java.util.regex.Pattern;

public class HelloController {
    @FXML
    private Button
            btn_resume,
            btn_vacance,
            btn_applications,
            btn_dop,
            btn_dop1,
            btn_dop2,
            btn_res1,
            btn_res2,
            btn_res3;

    @FXML
    private TextField
            txt_cofinder,
            txt_vacancy,
            txt_price,
            txt_recruiter,
            txt_name,
            txt_desc,
            txt_stricts,
            txt_sum;

    @FXML
    private ChoiceBox<String>
            txt_status,
            txt_type,
            txt_vid;

    @FXML
    private DatePicker txt_data_end;

    @FXML
    private Pane
            pane_applications,
            pane_new_application,
            pane_dop,
            pane_vacancy,
            pane_resume,
            pane_new_vacancy;

    @FXML
    private TableView<?>
            pane_dop2,
            pane_res1,
            pane_res2,
            pane_res3;

    @FXML
    private TableView<Application> table_applications;

    @FXML
    private TableView<VacancySimplePropertyMapper>
            table_vacancies,
            pane_dop1;

    private final ObservableList<Application> applications = FXCollections.observableArrayList();
    private final ObservableList<VacancySimplePropertyMapper> vacancies = FXCollections.observableArrayList();
    private final ObservableList<VacancySimplePropertyMapper> app_on_vac = FXCollections.observableArrayList();

    private Requests requests;


    boolean initiated = false;



    /**
     * Загружает данные из базы данных с помощью класса Requests.
     */

    void load() throws SQLException {
        requests = new Requests();
        List<VacancySimplePropertyMapper> list = requests.getAppOnVac();
        for (VacancySimplePropertyMapper vacancy : list) {
            vacancy.setNum(app_on_vac.size() + 1);
            app_on_vac.add(vacancy);
        }
    }


    /**
     *  Инициализирует контроллер. Устанавливает форматирование текстовых полей,
     *  загружает данные из базы данных, инициализирует элементы интерфейса.
     */
    void init() {
        Pattern validEditingState = Pattern.compile("-?(([1-9][0-9]*)|0)?(\\.[0-9]*)?");
        UnaryOperator<TextFormatter.Change> filter = c -> {
            String text = c.getControlNewText();
            if (validEditingState.matcher(text).matches()) {
                return c;
            } else {
                return null;
            }
        };
        StringConverter<Float> converter = new StringConverter<>() {
            @Override
            public Float fromString(String s) {
                if (s.isEmpty() || "-".equals(s) || ".".equals(s) || "-.".equals(s)) {
                    return 0.0f;
                } else {
                    return Float.valueOf(s);
                }
            }

            @Override
            public String toString(Float d) {
                return d.toString();
            }
        };

        txt_status.setItems(FXCollections.observableArrayList("активна", "закрыта"));

        TextFormatter<Float> textFormatter1 = new TextFormatter<>(converter, 0.0f, filter);
        TextFormatter<Float> textFormatter2 = new TextFormatter<>(converter, 0.0f, filter);
        txt_price.setTextFormatter(textFormatter1);
        txt_sum.setTextFormatter(textFormatter2);

        try {
            load();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        initiated = true;
    }

    /**
     * Сбрасывает видимость и состояние всех панелей и кнопок, а также настраивает таблицы.
     */
    void reButtons() {
        if (!initiated) init();

        table_applications.setPlaceholder(new Label(""));
        table_vacancies.setPlaceholder(new Label(""));
        pane_dop1.setPlaceholder(new Label(""));
        pane_dop2.setPlaceholder(new Label(""));
        pane_res1.setPlaceholder(new Label(""));
        pane_res2.setPlaceholder(new Label(""));
        pane_res3.setPlaceholder(new Label(""));

        btn_resume.setDisable(false);
        btn_vacance.setDisable(false);
        btn_applications.setDisable(false);
        btn_dop.setDisable(false);
        btn_dop1.setDisable(false);
        btn_dop2.setDisable(false);
        btn_res1.setDisable(false);
        btn_res2.setDisable(false);
        btn_res3.setDisable(false);

        pane_applications.setVisible(false);
        pane_new_application.setVisible(false);
        pane_dop.setVisible(false);
        pane_dop1.setVisible(false);
        pane_dop2.setVisible(false);
        pane_vacancy.setVisible(false);
        pane_resume.setVisible(false);
        pane_new_vacancy.setVisible(false);

        table_applications.getColumns().get(0).setCellValueFactory(new PropertyValueFactory<>("num"));
        table_applications.getColumns().get(1).setCellValueFactory(new PropertyValueFactory<>("cofinder"));
        table_applications.getColumns().get(2).setCellValueFactory(new PropertyValueFactory<>("vacancy"));
        table_applications.getColumns().get(3).setCellValueFactory(new PropertyValueFactory<>("status"));
        table_applications.getColumns().get(4).setCellValueFactory(new PropertyValueFactory<>("data_end"));
        table_applications.getColumns().get(5).setCellValueFactory(new PropertyValueFactory<>("price"));
        table_applications.getColumns().get(6).setCellValueFactory(new PropertyValueFactory<>("recruiter"));

        table_vacancies.getColumns().get(0).setCellValueFactory(new PropertyValueFactory<>("num"));
        table_vacancies.getColumns().get(1).setCellValueFactory(new PropertyValueFactory<>("name"));
        table_vacancies.getColumns().get(2).setCellValueFactory(new PropertyValueFactory<>("sum"));
        table_vacancies.getColumns().get(3).setCellValueFactory(new PropertyValueFactory<>("vid"));

        pane_dop1.getColumns().get(0).setCellValueFactory(new PropertyValueFactory<>("num"));
        pane_dop1.getColumns().get(1).setCellValueFactory(new PropertyValueFactory<>("name"));
        pane_dop1.getColumns().get(2).setCellValueFactory(new PropertyValueFactory<>("sum"));
        pane_dop1.getColumns().get(3).setCellValueFactory(new PropertyValueFactory<>("payed"));
    }

    /**
     * Обрабатывает нажатие кнопки подтверждения оплаты.
     * Обновляет состояние выбранной вакансии и добавляет ее в список вакансий.
     */
    @FXML
    protected void onBtnConfirmPayment1() {
        reButtons();
        VacancySimplePropertyMapper prop = pane_dop1.getSelectionModel().getSelectedItem();
        prop.setPayed(true);
        vacancies.add(prop);
        table_vacancies.setItems(vacancies);
        for (VacancySimplePropertyMapper vacancy : vacancies) {
            vacancy.setNum(vacancies.indexOf(vacancy) + 1);
        }
        onBtnVacance();
    }

    /**
     * Обрабатывает нажатие кнопки резюме.
     * Активирует панель резюме и вызывает метод onBtnRes1()
     */
    @FXML
    protected void onBtnResume() {
        reButtons();
        btn_resume.setDisable(true);
        pane_resume.setVisible(true);
        onBtnRes1();
    }

    /**
     * Обрабатывает нажатие кнопки вакансий. Активирует панель вакансий.
     */

    @FXML
    protected void onBtnVacance() {
        reButtons();
        btn_vacance.setDisable(true);
        pane_vacancy.setVisible(true);
    }

    /**
     * Обрабатывает нажатие кнопки заявок. Активирует панель заявок.
     */
    @FXML
    protected void onBtnApplications() {
        reButtons();
        btn_applications.setDisable(true);
        pane_applications.setVisible(true);
    }

    /**
     * Обрабатывает нажатие кнопки новой заявки. Переходит на панель новой заявки.
     */
    @FXML
    protected void onBtnNewApplication() {
        reButtons();
        pane_applications.setVisible(false);
        pane_new_application.setVisible(true);
    }

    /**
     * Обрабатывает нажатие кнопки новой вакансии. Переходит на панель новой вакансии.
     */
    @FXML
    protected void onBtnNewVacancy() {
        reButtons();
        pane_applications.setVisible(false);
        pane_new_vacancy.setVisible(true);
    }

    /**
     *  Удаляет выбранную заявку из списка заявок.
     */
    @FXML
    protected void onBtnDeleteApplication() {
        applications.remove(table_applications.getSelectionModel().getFocusedIndex());
        table_applications.setItems(applications);
        for (Application application : applications) {
            application.setNum(applications.indexOf(application) + 1);
        }
    }

    /**
     * Обрабатывает нажатие кнопки подтверждения заявки. Добавляет новую заявку в список заявок.
     */

    @FXML
    protected void onBtnConfirmApplication() {
        reButtons();
        applications.add(new Application(
                applications.size() + 1,
                txt_cofinder.getText(),
                txt_vacancy.getText(),
                txt_status.getValue(),
                txt_data_end.getEditor().getText(),
                Float.parseFloat(txt_price.getText()),
                txt_recruiter.getText()));
        table_applications.setItems(applications);
        onBtnApplications();
    }

    /**
     * Обрабатывает нажатие кнопки подтверждения вакансии. Добавляет новую вакансию в список вакансий.
     */
    @FXML
    protected void onBtnConfirmVacancy() {
        reButtons();

        VacancySimplePropertyMapper vacancy = new VacancySimplePropertyMapper(
                txt_name.getText(),
                txt_desc.getText(),
                txt_stricts.getText(),
                txt_type.getValue(),
                txt_vid.getValue()
                , Float.parseFloat(txt_sum.getText()),
                true);
        vacancy.setNum(vacancies.size() + 1);

        vacancies.add(vacancy);
        table_vacancies.setItems(vacancies);
        onBtnDop();
    }

    /**
     * Заготовка для обработки нажатия кнопки подтверждения резюме.
     */

    @FXML
    protected void onBtnConfirmResume() {
    }

    /**
     *  Переключает видимость на первую панель резюме.
     */
    @FXML
    protected void onBtnRes1() {
        pane_res1.setVisible(true);
        btn_res1.setDisable(true);
        pane_res2.setVisible(false);
        btn_res2.setDisable(false);
        pane_res3.setVisible(false);
        btn_res3.setDisable(false);
    }

    /**
     * Переключает видимость на вторую панель резюме.
     */
    @FXML
    protected void onBtnRes2() {
        pane_res1.setVisible(false);
        btn_res1.setDisable(false);
        pane_res2.setVisible(true);
        btn_res2.setDisable(true);
        pane_res3.setVisible(false);
        btn_res3.setDisable(false);
    }

    /**
     * Переключает видимость на третью панель резюме.
     */
    @FXML
    protected void onBtnRes3() {
        pane_res1.setVisible(false);
        btn_res1.setDisable(false);
        pane_res2.setVisible(false);
        btn_res2.setDisable(false);
        pane_res3.setVisible(true);
        btn_res3.setDisable(true);
    }

    /**
     * Обрабатывает нажатие кнопки "Дополнительно".
     * Активирует панель "Дополнительно" и вызывает метод onBtnDop1().
     */
    @FXML
    protected void onBtnDop() {
        reButtons();
        btn_dop.setDisable(true);
        pane_dop.setVisible(true);
        onBtnDop1();
    }

    /**
     * Переключает видимость на первую панель "Дополнительно".
     */

    @FXML
    protected void onBtnDop1() {
        pane_dop1.setVisible(true);
        btn_dop1.setDisable(true);
        pane_dop2.setVisible(false);
        btn_dop2.setDisable(false);
    }

    /**
     * Переключает видимость на вторую панель "Дополнительно".
     */
    @FXML
    protected void onBtnDop2() {
        pane_dop1.setVisible(false);
        btn_dop1.setDisable(false);
        pane_dop2.setVisible(true);
        btn_dop2.setDisable(true);
    }
}