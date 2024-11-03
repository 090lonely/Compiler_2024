module com.example.compiler_2024 {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.compiler_2024 to javafx.fxml;
    exports com.example.compiler_2024;
}