## Rails Italian Recipes App

<a name="readme-top"></a>
<div align="center">
    <img src="/app/assets/images/logo_jcm_md.png" alt="main-logo" width="500"  height="auto" />
  <br/>
  <h3><b>Ruby on Rails Italian Recipes App</b></h3>
</div>
📗 Table of Contents <a name="table_of-contents"></a>

- [📗 Table of Contents](#table-of-contents)
- [📖 About project ](#about-project)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

## 📖 About project - Ruby on Rails Italian Recipes App <a name="about-project"></a>

The Ruby on Rails (RoR) Italian Recipes App is a complete Recipe web project including a PostgreSQL database connection, user authentication, CRUD operations, user validation, and testing. It's a complete app.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li><a href="https://ruby-doc.org/">Ruby v 3.2.2</a></li>
    <li><a href="https://rubyonrails.org/">Rails v 7.1.2</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL v 16.1.1</a></li>
  </ul>

### Key Features <a name="key-features"></a>
- **Set up a Ruby on Rails project.**
- **Set up linters using Stylelint and Rubocop**
- **Connect the Rails project to a PostgreSQL database.**
- **Define and set up the Data Model using Active Record migration. Implement table associations and data processing methods in the data model.**
- **Include controllers, and views for displaying: a list of recipes page (all), a list of public recipes page, a recipe details page, a list of ingredients (food) page, and a shopping list page (missing ingredients). Follow the wireframe designs.**
- **Implementing user authentication by means of the Devise gem.**
- **Implementing authorization rules by means of the CanCanCan gem.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)

[Set Up Rails](https://www.ruby-lang.org/en/documentation/installation/)

Prerquisites: Ruby, Ruby Development Kit (for Windows), Ruby Gems packaging system, and PostgreSQL database server. Run the following commands...
```sh
$ gem install rails
```

### Setup

```sh
  cd my-folder
  git clone https://github.com/jcmunav63/rails-italian-recipes-app.git
```

### Install

This project requires the following dependencies: Ruby interpreter, Gem package manager, Ruby on Rails web framework, PostgreSQL database server, RSpec for unit testing and Capybara for integration tests. Additionally, the project requires two linters checkers: RuboCop (Ruby) and Stylelint (CSS styles).

```sh
bundle install
```

### Usage

To run the project, navigate to the project directory and execute the following command:

Start the Ruby on Rails web server (Puma server) typing the following command...
```sh
  rails s , or the complete command,
  rails server
```

### Run tests

* Install the Rubocop and Stylelint linters.

Install the Rubocop linters checker using the following steps...
- First add the following code to the Gem file:
```sh
gem 'rubocop', '>= 1.0', '< 2.0'
```
- Second run the command to install dependicies in your project:
```sh
bundle install
```
- Remember to copy the .rubocop.yml file to your root directory.

gem 'rubocop', '>= 1.0', '< 2.0'

Install Stylelint linters checker using the following command...
```sh
npm install --save-dev stylelint@13.x stylelint-scss@3.x stylelint-config-standard@21.x stylelint-csstree-validator@1.x
```
- Remember to copy the .stylelintrc.json file to the root directory.

- Copy the linters.yml file inside of path .github/workflows


To run LINTERS, run the following command:

Run the following command for Ruby code...
```sh
rubocop
```

Run the following command for CSS code...
```sh
npx stylelint "**/*.{css,scss}"
```

* Implement unit tests using RSpec.
* Implement integration tests with RSpec & Capybara.

### Deployment	

This project has been deployed on Render (free version). You'll have to wait a few minutes if the server is inactive at some point.

URL: https://rails-italian-recipes-app.onrender.com/	


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Juan Carlos Muñoz**

- GitHub: [@jcmunav63](https://github.com/jcmunav63)
- Twitter: [@jcmunav63](https://twitter.com/jcmunav63)
- LinkedIn: [@juan-carlos-muñoz](https://www.linkedin.com/in/juan-carlos-mu%C3%B1oz-5a15b6276/)

👤 **Mohammed Jamal**

- GitHub: [@mohamedgamaleldin999999](https://github.com/mohamedgamaleldin999999)
- Twitter: [@mohammedjamal](https://twitter.com/Mohamme43086002)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **App deplyment on Render.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please give a star.
Thanks in advance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank all of my colleagues who inspire me to do my best everyday.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

**Did you create this project from scratch?**

  - Yes, it is a complete Ruby on Rails project for creating a web Ruby on Rails Italian Recipes App, with connection to an external PostgreSQL database, CRUD operations, data validation, user authentication, and testing.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
