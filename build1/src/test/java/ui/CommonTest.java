package ui;

import com.codeborne.selenide.*;
import org.junit.jupiter.api.*;
import org.openqa.selenium.*;

import java.util.*;

import static com.codeborne.selenide.Condition.*;
import static com.codeborne.selenide.Selenide.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CommonTest extends BaseSetup {


    @Test
    public void createNewArticle() {
        $x("//a[@href='/editor']").click();
        String articleTitle = "Drill4J" + UUID.randomUUID();
        $x("//input[@ng-reflect-name='title']").sendKeys(articleTitle);
        $x("//input[@ng-reflect-name='description']").sendKeys("Drill4J 2023");
        $x("//textarea[@ng-reflect-name='body']").sendKeys("Drill is cool!");
        $x("//input[@placeholder='Enter tags']").sendKeys("drill");
        $x("//button[text()=' Publish Article ']").click();
        $x("//div[@class='container']/h1").shouldHave(Condition.exactText(articleTitle));
    }

    @Test
    public void editArticle() {
        $x("//a[text()=' Global Feed ']").click();
        $x("//a[@href='/article/test-article']").click();
        $x("//a[text()=' Edit Article ']").click();
        $x("//textarea[@ng-reflect-name='body']").sendKeys(" We would appreciate any feedback.");
        $x("//button[text()=' Publish Article ']").click();
        $x("//p[contains(.,'Text We would appreciate any feedback.')]")
                .shouldBe(Condition.visible);
    }

    @Test
    public void addComment() {
        $x("//a[text()=' Global Feed ']").click();
        $x("//a[@href='/article/test-article']").click();
        $x("//textarea[@placeholder='Write a comment...']").sendKeys("Does drill support MacOS?");
        $x("//button[text()=' Post Comment ']").click();
        $x("//p[contains(.,'Does drill support MacOS?')]")
                .shouldBe(Condition.visible);
    }

    @Test
    public void deleteComment() {
        $x("//a[text()=' Global Feed ']").click();
        $x("//a[@href='/article/test-article']").click();
        $x("//div[@class='card']//i[@class='ion-trash-a']").click();
    }

    @Test
    public void hugeTest_1() throws InterruptedException {
        $x("//a[text()=' Global Feed ']").click();
    }

    @Test
    public void hugeTest_2() throws InterruptedException {
        $x("//a[text()=' Global Feed ']").click();
    }

    @Test
    public void hugeTest_3() throws InterruptedException {
        $x("//a[text()=' Global Feed ']").click();
    }

    @Test
    public void hugeTest_4() throws InterruptedException {
        $x("//a[text()=' Global Feed ']").click();
    }

    @Test
    public void hugeTest_5() throws InterruptedException {
        $x("//a[text()=' Global Feed ']").click();
    }


    @Test
    public void toggleHeart() {
        $x("//a[text()=' Global Feed ']").click();
        $x("//i[@class='ion-heart']").click();
        $x("//app-favorite-button[contains(.,'1')]").shouldBe(Condition.visible);
    }


    @Test
    public void deleteArticle() {
        $x("//a[text()=' Global Feed ']").click();
        $x("//a[@href='/article/delete']").click();
        $x("//button[contains(.,' Delete Article ')]").click();
        $x("//a[text()=' Global Feed ']").click();
        $x("//a[@href='/article/delete']").shouldNotBe(Condition.visible);
    }

    @Test
    public void loginUser() {
        logout();
        $x("//a[@href='/login']").click();
        $x("//input[@ng-reflect-name='email']").sendKeys(email);
        $x("//input[@ng-reflect-name='password']").sendKeys(password);
        $x("//button[text()=' Sign in ']").click();
        $x("//a[@href='/profile/test']").shouldHave(text(user));
    }

    @Test
    public void logoutUser() {
        $x("//a[@href='/profile/test']").click();
        $x("//a[@href='/settings']").click();
        $x("//button[text()=' Or click here to logout. ']").click();
        login();
    }

    @Test
    public void registerNewUser() {
        logout();
        String user = UUID.randomUUID() + "user";
        String email = UUID.randomUUID() + "@user.user";
        $(By.partialLinkText("Sign up")).click();
        $x("//input[@ng-reflect-name='username']").sendKeys(user);
        $x("//input[@ng-reflect-name='email']").sendKeys(email);
        $x("//input[@ng-reflect-name='password']").sendKeys(password);
        $x("//button[text()=' Sign up ']").click();
        $x("//a[@href='/profile/" + user + "']").shouldHave(text(user));
        Selenide.clearBrowserCookies();
        Selenide.clearBrowserLocalStorage();
        logout();
        login();
    }
}
