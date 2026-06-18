package ui;

import org.junit.jupiter.api.*;

import com.codeborne.selenide.*;
import static com.codeborne.selenide.Selenide.*;
import static io.restassured.RestAssured.*;

public class BaseSetup {

    public static String user = "test";
    public static String email = "test@test.test";
    public static String password = "test123";
    public static String baseUrl = "http://localhost:8080";

    public BaseSetup() {
        Configuration.baseUrl = baseUrl;
        Configuration.holdBrowserOpen = true;
        Configuration.browser = "chrome";
        given()
                .header("Content-Type", "application/json")
                .body("{\"user\":{\"email\":\"" + email + "\",\"password\":\"" + password + "\",\"username\":\"" + user + "\"}}")
                .post(baseUrl + "/api/users");
        String token = given()
                .header("Content-Type", "application/json")
                .body("{\"user\":{\"email\":\"" + email + "\",\"password\":\"" + password + "\"}}")
                .post(baseUrl + "/api/users/login")
                .getBody()
                .jsonPath()
                .getString("user.token");
        given()
                .header("Content-Type", "application/json")
                .header("Authorization", "Token " + token)
                .body("{\"article\":{\"tagList\":[],\"title\":\"Test Article\",\"description\":\"Autotests\",\"body\":\"Text\"}}")
                .post(baseUrl + "/api/articles/");
        given()
                .header("Content-Type", "application/json")
                .header("Authorization", "Token " + token)
                .body("{\"article\":{\"tagList\":[],\"title\":\"delete\",\"description\":\"Autotests\",\"body\":\"Text\"}}")
                .post(baseUrl + "/api/articles/");
        given()
                .header("Content-Type", "application/json")
                .header("Authorization", "Token " + token)
                .body("{\"comment\":{\"body\":\"text\"}}")
                .post(baseUrl + "/api/articles/test-article/comments");
    }

    @BeforeAll
    public static void beforeAll() {
        System.out.println("beforeAll Base URL: " + baseUrl);
        System.setProperty("webdriver.chrome.driver", "..\\chrome-driver\\chromedriver-win64\\chromedriver.exe");
        Configuration.browserBinary = "..\\chromium-binary\\chrome-win64\\chrome.exe";
        open(baseUrl);
    }

    @AfterAll
    public static void afterAll() {
        given().delete(baseUrl + "/api/articles/delete").then();
        Selenide.clearBrowserCookies();
        Selenide.clearBrowserLocalStorage();
        closeWindow();
    }

    @BeforeEach
    public void setUp() {
        open(baseUrl);
        login();
    }

    public static void login() {
        try {
            open(baseUrl);
            $x("//a[@href='/login']").click();
            $x("//input[@ng-reflect-name='email']").sendKeys(email);
            $x("//input[@ng-reflect-name='password']").sendKeys(password);
            $x("//button[text()=' Sign in ']").click();
        } catch (Throwable ignored) {
        }
    }

    public static void logout() {
        try {
            open(baseUrl);
            $x("//a[@href='/profile/test']").click();
            $x("//a[@href='/settings']").click();
            $x("//button[text()=' Or click here to logout. ']").click();
        } catch (Throwable ignored) {
        }
    }

}