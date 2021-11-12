[![Build Status](https://circleci.com/gh/hschmid516/snowmigo-api.svg?style=shield&circle-token=:circle-token)](https://travis-ci.org/khoifishpond/snowmigo-fe)

# Snowmigo BE

The back-end half of a Consultancy project during weeks four and five during Mod 3 of Turing. For front-end, please visit [Snowmigo](https://github.com/khoifishpond/snowmigo-fe).


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#deployment">Deployment</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
  <p>
    The goal of this project is to create a successful web application from a student-led project idea. Our team created multiple endpoints that allowed for CRUD functionality, ranging from Users and Trips information.
  </p>

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With
#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />
  <img src="https://img.shields.io/badge/VS_Code-007ACC?logo=visual%20studio%20code&logoColor=ffffff" />
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />

</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/geocoder-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" /> </br>
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/orderly-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/circleci-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
    <img src="https://img.shields.io/badge/json_api_serializer-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />
</p>


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com/hschmid516/snowmigo-api.git
   ```
3. Run bundle
   ```sh
   bundle install
   ```
4. Run migrations
   ```sh
   rails db:{create,migrate,seed}
   ```

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- DEPLOYMENT -->
### Deployment

Visit [Herkou](https://snowmigo.herokuapp.com)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- <p><b>GET '/api/v1/users'</b></p>

  ```json
  {
    "data": [
      {
        "id": "1",
        "type": "user",
        "attributes": {
          "name": "Mace Windu",
          "email": "elenora@ondricka.org",
          "exp_level": "10",
          "ski_pass": "Epic",
          "address": "Apt. 459 922 Wehner Stravenue, Lake Hoyt, GA 40829",
          "ski_or_board": "3",
          "emergency_name": "Saruman the White",
          "emergency_number": "2813308004",
          "trips": [
            {
              "data": {
                "id": "1",
                "type": "trip",
                "attributes": {
                  "name": "Cool Trip Name",
                  "resort_id": null,
                  "resort_name": null,
                  "start_date": "2021-11-02",
                  "end_date": "2021-11-08",
                  "vote_status": "open",
                  "riders": [
                    {
                      "data": {
                        "id": "1",
                        "type": "rider",
                        "attributes": {
                          "user_id": 1,
                          "trip_id": 1,
                          "host": false,
                          "driver": false,
                          "budget": 25,
                          "rider_name": "Mace Windu",
                          "vote": null
                        }
                      }
                    }
                  ],
                  "resort_options": [
                    {
                      "data": {
                        "id": "1",
                        "type": "resort_option",
                        "attributes": {
                          "trip_id": 1,
                          "resort_id": 3,
                          "resort_name": "Elwanda",
                          "vote_count": 0
                        }
                      }
                    },
                    {
                      "data": {
                        "id": "2",
                        "type": "resort_option",
                        "attributes": {
                          "trip_id": 1,
                          "resort_id": 58,
                          "resort_name": "Portia",
                          "vote_count": 0
                        }
                      }
                    }
                  ]
                }
              }
            }
          ]
        }
      },
      ...
      ...
      ...,
      {
        "id": "12",
        "type": "user",
        "attributes": {
          "name": "Obi-Wan Kenobi",
          "email": "reyes@leuschke.biz",
          "exp_level": "6",
          "ski_pass": "Ikon",
          "address": "4183 Botsford Falls, Kieraberg, MN 74214-4567",
          "ski_or_board": "2",
          "emergency_name": "Shadowfax",
          "emergency_number": "2813308004",
          "trips": [
            {
              "data": {
                "id": "201",
                "type": "trip",
                "attributes": {
                  "name": "trip",
                  "resort_id": 909002,
                  "resort_name": null,
                  "start_date": "2021-11-11",
                  "end_date": "2021-11-13",
                  "vote_status": "closed",
                  "riders": [
                    {
                      "data": {
                        "id": "191",
                        "type": "rider",
                        "attributes": {
                          "user_id": 8,
                          "trip_id": 201,
                          "host": true,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Henry Schmid",
                          "vote": 909002
                        }
                      }
                    },
                  ],
                  "resort_options": []
                }
              }
            }
          ],
          "friends": [
            {
              "data": {
                "id": "2",
                "type": "friendship",
                "attributes": {
                  "user_id": 2,
                  "friend_id": 1,
                  "friend_name": "Mace Windu"
                }
              }
            }
          ]
        }
      }
    ]
  }
  ```

- <p><b>GET '/api/v1/users/{:id}'</b></p>

  ```json
  {
    "data": {
      "id": "2",
      "type": "user",
      "attributes": {
        "name": "Obi-Wan Kenobi",
        "email": "reyes@leuschke.biz",
        "exp_level": "6",
        "ski_pass": "Ikon",
        "address": "4183 Botsford Falls, Kieraberg, MN 74214-4567",
        "ski_or_board": "2",
        "emergency_name": "Shadowfax",
        "emergency_number": "2813308004",
        "trips": [
          {
            "data": {
              "id": "201",
              "type": "trip",
              "attributes": {
                  "name": "trip",
                  "resort_id": 909002,
                  "resort_name": null,
                  "start_date": "2021-11-11",
                  "end_date": "2021-11-13",
                  "vote_status": "closed",
                  "riders": [
                    {
                      "data": {
                        "id": "191",
                        "type": "rider",
                        "attributes": {
                          "user_id": 8,
                          "trip_id": 201,
                          "host": true,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Henry Schmid",
                          "vote": 909002
                        }
                      }
                    },
                    {
                      "data": {
                        "id": "196",
                        "type": "rider",
                        "attributes": {
                          "user_id": 6,
                          "trip_id": 201,
                          "host": false,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Michael Osmonson",
                          "vote": null
                        }
                      }
                    },
                    {
                      "data": {
                        "id": "197",
                        "type": "rider",
                        "attributes": {
                          "user_id": 6,
                          "trip_id": 201,
                          "host": false,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Michael Osmonson",
                          "vote": null
                        }
                      }
                    },
                    {
                      "data": {
                        "id": "198",
                        "type": "rider",
                        "attributes": {
                          "user_id": 1,
                          "trip_id": 201,
                          "host": false,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Mace Windu",
                          "vote": null
                        }
                      }
                    },
                    {
                      "data": {
                        "id": "199",
                        "type": "rider",
                        "attributes": {
                          "user_id": 2,
                          "trip_id": 201,
                          "host": false,
                          "driver": null,
                          "budget": null,
                          "rider_name": "Obi-Wan Kenobi",
                          "vote": null
                        }
                      }
                    }
                  ],
                "resort_options": []
              }
            }
          }
        ],
        "friends": [
          {
            "data": {
              "id": "2",
              "type": "friendship",
              "attributes": {
                "user_id": 2,
                "friend_id": 1,
                "friend_name": "Mace Windu"
              }
            }
          }
        ]
      }
    }
  }
  ```

- <p><b>GET 'api/v1/trips'</b></p>

  ```json
  {
    "data": [
      {
        "id": "1",
        "type": "trip",
        "attributes": {
          "name": "Cool Trip Name",
          "resort_id": null,
          "resort_name": null,
          "start_date": "2021-11-02",
          "end_date": "2021-11-08",
          "vote_status": "open",
          "riders": [
            {
              "data": {
                "id": "1",
                "type": "rider",
                "attributes": {
                  "user_id": 1,
                  "trip_id": 1,
                  "host": false,
                  "driver": false,
                  "budget": 25,
                  "rider_name": "Mace Windu",
                  "vote": null
                }
              }
            },
            {
              "data": {
                "id": "189",
                "type": "rider",
                "attributes": {
                  "user_id": 1,
                  "trip_id": 1,
                  "host": false,
                  "driver": null,
                  "budget": null,
                  "rider_name": "Mace Windu",
                  "vote": null
                }
              }
            }
          ],
          "resort_options": [
            {
              "data": {
                "id": "1",
                "type": "resort_option",
                "attributes": {
                  "trip_id": 1,
                  "resort_id": 3,
                  "resort_name": "Elwanda",
                  "vote_count": 0
                }
              }
            },
            {
              "data": {
                "id": "2",
                "type": "resort_option",
                "attributes": {
                  "trip_id": 1,
                  "resort_id": 58,
                  "resort_name": "Portia",
                  "vote_count": 0
                }
              }
            }
          ]
        }
      },
      ...
      ...
      ...,
      {
        "id": "100",
        "type": "trip",
        "attributes": {
          "name": "Happy fun time",
          "resort_id": null,
          "resort_name": null,
          "start_date": "2021-11-08",
          "end_date": "2021-11-25",
          "vote_status": "open",
          "riders": [
            {
              "data": {
                "id": "76",
                "type": "rider",
                "attributes": {
                  "user_id": 10,
                  "trip_id": 100,
                  "host": true,
                  "driver": null,
                  "budget": null,
                  "rider_name": "Freddie Mercury",
                  "vote": null
                }
              }
            }
          ],
          "resort_options": [
            {
              "data": {
                "id": "31",
                "type": "resort_option",
                "attributes": {
                  "trip_id": 100,
                  "resort_id": 303001,
                  "resort_name": "Arapahoe Basin",
                  "vote_count": 0
                }
              }
            }
          ]
        }
      }
    ]
  }
  ```

- <p><b>GET '/api/v1/trips/{:id}'</b></p>

  ```json
  {
    "data": {
      "id": "41",
      "type": "trip",
      "attributes": {
        "name": "Happy fun time",
        "resort_id": null,
        "resort_name": null,
        "start_date": "2021-11-08",
        "end_date": "2021-11-25",
        "vote_status": "open",
        "riders": [],
        "resort_options": []
      }
    }
  }
  ```

- <p><b>POST '/api/v1/users'</b></p>

  ```rb
  attributes = {
    name: STRING,
    email: STRING,
    exp_level: STRING,
    ski_pass: STRING,
    address: STRING,
    ski_or_board: STRING,
    emergency_name: STRING,
    emergency_number: STRING
  }
  ```

- <p><b>PATCH '/api/v1/users/{:id}'</b></p>

  ```rb
  attributes = {
    name: STRING (OPTIONAL),
    email: STRING (OPTIONAL),
    exp_level: STRING (OPTIONAL),
    ski_pass: STRING (OPTIONAL),
    address: STRING (OPTIONAL),
    ski_or_board: STRING (OPTIONAL),
    emergency_name: STRING (OPTIONAL),
    emergency_number: STRING (OPTIONAL)
  }
  ```

- <p><b>DESTROY '/api/v1/users'</b></p>
</br>
  

See the [open issues](https://github.com/hschmid516/snowmigo-api/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Henry Schmid](https://www.linkedin.com/in/henry-schmid)
- [Erika Kischuk](https://www.linkedin.com/in/erika-kischuk)
- [Laura Court](https://www.linkedin.com/in/andrew-massey-b06662194/)
- [Khoi Nguyen](https://www.linkedin.com/in/khoifishpond/)
- [Ozzie Osmonson](https://www.linkedin.com/in/ozzie-osmonson/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Henry Schmid](https://github.com/hschmid516)
- [Erika Kischuk](https://github.com/eakischuk)
- [Laura Court](https://github.com/lmcourt)
- [Khoi Nguyen](https://github.com/khoifishpond)
- [Ozzie Osmonson](https://github.com/ozzman84)


<p align="right">(<a href="#top">back to top</a>)</p>