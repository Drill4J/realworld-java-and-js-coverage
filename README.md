# Drill4J: Java + JavaScript setup

This repository demonstrates how Drill4J enables various metrics collection (including coverage) for both backend and frontend applications across multiple builds

The demo is based on [RealWorld example apps](https://codebase.show/projects/realworld)

## Notes

1. This is not an installation guide. For the installation instructions, please refer to the documentation on [Drill4J Website](https://drill4j.github.io/docs/installation/drill-admin)

2. *at the moment* this demo works only for Windows 10.

3. *at the moment* Frontend JavaScript coverage collection for automated tests works only when running **headful Chrome**

> Efforts to enable Frontend coverage collection for both headless Chrome support and Linux/macOS are in progress.

## Setup overview

1. There is RealWorld API service and RealWorld Frontend service. These are example applications, think of them as "target" applications which you want to collect metrics from.

2. Both are forked and modifed to enable Drill4J integration
    - [Backend API service](https://github.com/Drill4J/spring-boot-realworld-example-app)
    - [Frontend application](https://github.com/Drill4J/angular-realworld-example-app)

3. Additionally, [Drill4J Backend Admin API service](http://localhost:8091) and [Drill4J Admin Panel](http://localhost:8091) are deployed.

## Running demo

### Deploy Drill4J services and the **1-st** application build

1. Launch Drill4J services & deploy 1-st application build

    ```shell
    ./demo-up.sh
    ```

2. Open [Frontend Example Application](http://localhost:8080) and wait until it becomes available

3. Open [Drill4J Admin Panel](http://localhost:8091). Expand the group entry, then register both backend and frontend agent.

      > There is no need to specify any parameters during the registration, just click through steps leaving everything as-is.

### Run tests for the **1-st** application build

1. Run

    ```shell
    ./gradlew clean :build1:test
    ```

2. Wait for tests to complete

3. Open [Drill4J Admin Panel](http://localhost:8091) to see the result

4. Finish both scopes


### Deploy the **2-nd** application build

1. Deploy the 2-nd application build

    ```shell
    ./demo-deploy-build2.sh
    ```

2. Wait for build notification to appear (click the Bell icon in the top-right corner of the page)

3. **Optional**: Click on the "Dashboard" button inside notification to explore the new build. See how Drill4J detected new, modified and deleted methods

### Run tests for the **2-nd** application build

1. Run tests by

    ```shell
    ./gradlew clean :build2:test
    ```

2. Wait for tests to complete

3. Open [Drill4J Admin Panel](http://localhost:8091) to see the result

4. Finish both scopes


### Deploy the **3-rd** application build

1. Deploy the 2-nd application build

    ```shell
    ./demo-deploy-build3.sh
    ```

2. Again, wait for build notification to appear in the (bell in the top-right corner must have a red circle next to it)

### Run tests for the **3-rd** application build

1. Run

    ```shell
    ./gradlew clean :build3:test
    ```

2. Wait for tests to complete

3. Open [Drill4J Admin Panel](http://localhost:8091) to see the result

## Teardown

1. To remove demo setup run

  ```shell
  ./demo-down.sh
  ```
