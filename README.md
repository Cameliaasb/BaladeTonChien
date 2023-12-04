# BaladeTonChien 🐾🚶‍♀️🐕🚶‍♂️🐾

BaladeTonChien is a Progressive Web App (PWA) built with Ruby on Rails designed to make it easy for dog owners to discover nearby dog walks and connect with other dog owners for group walks. With a user-friendly interface and location-based features, BaladeTonChien is the perfect companion for your furry friend's outdoor adventures.

It was created as part of a two-week bootcamp project, demonstrating the ability to develop a functional application within a limited timeframe. All walks available are within the Lyon region and are sourced from the [Grand Lyon API](https://data.grandlyon.com/portail/fr/jeux-de-donnees/boucles-randonnee-metropole-lyon/api).


## Responsive Design

BaladeTonChien is designed to provide an optimal experience on mobile devices. / To fully appreciate the mobile-friendly features and layout, we recommend viewing the application in a mobile-like mode using your browser's developer tools.


![screenshot](app/assets/images/screenshot1.png?raw=true "App screenshot")
![screenshot](app/assets/images/screenshot2.png?raw=true "App screenshot")



## Features

- **Dog Profile:** Create a profile for your dog, complete with photos and information.
- **Discover Dog Walks:** Browse a curated map of dog-friendly walks and trails in your area.
- **Find the Right Walk:** Filter the map with a keyword, difficulty level, max duration or distance.
- **Connect with other Dog Owners:** Plan your own dog walks and invite other dog owners to join you with a Tinder like swiping interface.
- **Real-time Chat:** Chat with other dog owners to finalize walk details and share experiences.

## Rails / Ruby version

Current Rails version is 7.0.7 \
Current Ruby version is 3.1.2

## Stimulus.js

BaladeTonChien makes use of [Stimulus.js](https://stimulusjs.org/) for map filtering and the Tinder-like swiping interface.

## Configuration

To configure the application, create a `.env` file and set the necessary environment variables.

## Dependencies

### Ruby gems
BaladeTonChien relies on a set of Ruby gems to function seamlessly. These gems are managed and installed using Bundler, a dependency management tool for Ruby projects.

If you're setting up BaladeTonChien for the first time or working on the project, you can install all the required gems by running the following command:

`bundle install`

### Database Setup

Ensure you have PostgreSQL installed and running on your system.

### Cloudinary

[Cloudinary](https://cloudinary.com/) is used for image and video management in BaladeTonChien. To use Cloudinary with the project, follow these steps:

1. Sign up for a Cloudinary account and obtain your API credentials.
2. Configure your Cloudinary credentials in the project's `.env` file.

Make sure to set up these external dependencies properly for the full functionality of the BaladeTonChien project.

### MapBox

1. Sign up for a Mapbox account and obtain your Mapbox API credentials.
2. Configure your Mapbox credentials in the project's `.env` file.

## Testing

BaladeTonChien is tested using Rspec. To run the test suite, use the following command:

``
rspec
``

This will execute all the tests and provide you with feedback on the status of the application's functionality.

----------

## Getting Started

To set up BaladeTonChien on your local machine, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Cameliaasb/BaladeTonChien.git
   cd BaladeTonChien
   ```

2. **Install dependencies:**
   Make sure you have Ruby and Rails installed on your machine. Then, run:
   ```bash
   bundle install
   ```

3. **Database Setup:**

   Run the database migrations to set up the database schema:

   ```bash
   rails db:migrate
   ```

   Seed the database with initial data from [Grand Lyon API](https://data.grandlyon.com/portail/fr/jeux-de-donnees/boucles-randonnee-metropole-lyon/api) and JSON files:
   ```
   rails db:seed
   ```

4. **Start the Application:**
   ```
   rails server
   ```

5. **Access BaladeTonChien:**

   Open your web browser and navigate to http://localhost:3000 to access the BaladeTonChien application.\
   🐾 🐕 Now you have BaladeTonChien running locally on your machine. Enjoy exploring and using it! 🐕 🐾
