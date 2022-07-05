# Rent Ready Technical Assessment

This assignment covers following requirements or goals:

1. Creating flutter application
2. Ability to search accounts by account name or accountnumber
3. Ability to select filter options from a popup list with options to filter by statecode or stateorprovince
4. Authenticate to MS Dataverse webapi using OAuth 2.0
5. Utilize MS Dataverse's REST api endpoints to fetch, search and filter Accounts objects in flutter application.
6. Ability switch between list and grid layout options.
7. Implement a detail page.
8. Implement a preloader.
9. Unit test.
10. UI component tests (Widgets test in flutter)
11. Solution in a public repository
12. Meaningful readme.md in the repository root
13. Setup build scripts in docker container

The application has been tested on iPhone and Android envoirnments with Web coming soon. Also since this is just a test and not a production app so I've taken the liberty of some shortcuts e.g. aggregating multiple tests, mocking in a non-fancy way etc. to save time.

## Steps to build Docker container
1. Make sure that Docker is installed on system and "docker -v" works
2. Execute `docker-compose up --build` from project root.
3. Once docker build is complete. Execute `docker exec -it rentready_flutter bash`
4. Execute flutter commands as needed inside docker container

### Accounts list view
<img src="https://raw.githubusercontent.com/qasim90/rentready_flutter/master/screenshots/accounts_list.png" width="600" height="1298"  />

### Accounts grid view
<img src="https://raw.githubusercontent.com/qasim90/rentready_flutter/master/screenshots/accounts_grid.png" width="600" height="1298"  />

### Filters popup
<img src="https://raw.githubusercontent.com/qasim90/rentready_flutter/master/screenshots/filters.png" width="600" height="1298"  />

### Detail page
<img src="https://raw.githubusercontent.com/qasim90/rentready_flutter/master/screenshots/account_detail.png" width="600" height="1298"  />
