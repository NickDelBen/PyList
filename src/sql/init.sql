
/* Tracks can be from different sources */
CREATE TYPE track_source AS ENUM ('youtube', 'spotify', 'soundcloud');
/* Users have different roles */
CREATE TYPE user_role AS ENUM ('administrator', 'moderator', 'user');

/* The status of a server */
CREATE TYPE server_status AS ENUM ('active', 'inactive', 'error');
/* The status of a playlist */
CREATE TYPE playlist_status AS ENUM ('open', 'active', 'disabled');

/* Users have passwords */
CREATE TYPE secret_password AS VARCHAR(256);
/* Tracks have codes to identify them in an api */
CREATE TYPE track_code AS VARCHAR(128);
/* Images are stored for different reasons */
CREATE TYPE image AS VARCHAR(256);


/* Server are run independant of one another */
CREATE TABLE servers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE,
  port INTEGER NOT NULL,
  link VARCHAR(256),
  status server_status NOT NULL
);

/* A server has many registered users */
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(32) NOT NULL,
  picture image,
  registered DATE NOT NULL DEFAULT CURRENT_DATE,
  contributions int NOT NULL DEFAULT 0,
  login VARCHAR(30) NOT NULL,
  password secret_password NOT NULL
);

/* Each server has many playlists */
CREATE TABLE playlists (
  id SERIAL PRIMARY KEY,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  creator INTEGER REFERENCES users(id),
  server INTEGER REFERENCES servers(id)
);

/* Each playlist has multiple tracks */
CREATE TABLE tracks (
  id SERIAL PRIMARY KEY,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  source track_source NOT NULL,
  code track_code NOT NULL,
  artist VARCHAR(64),
  title VARCHAR(128) NOT NULL,
  duration INTEGER NOT NULL,
  picture image
);

/* Users can access servers */
CREATE TABLE permissions (
  id SERIAL PRIMARY KEY,
  user INTEGER REFERENCES users(id) NOT NULL,
  server INTEGER REFERENCES servers(id) NOT NULL,
  role user_role NOT NULL
);

/* Users can contribute to playlists */
CREATE TABLE contributors (
  id SERIAL PRIMARY KEY,
  user INTEGER REFERENCES users(id) NOT NULL,
  playlist INTEGER REFERENCES playlists(id) NOT NULL,
  added DATE NOT NULL DEFAULT CURRENT_DATE,
  contributions INTEGER NOT NULL DEFAULT 0,
  role user_role NOT NULL
);

/* Tracks are contributed to playlists by users */
CREATE TABLE contributions (
  id SERIAL PRIMARY KEY,
  playlist INTEGER REFERENCES playlists(id) NOT NULL,
  contributor INTEGER REFERENCES users(id) NOT NULL,
  entry INTEGER REFERENCES tracks(id) NOT NULL,
  added DATE NOT NULL DEFAULT CURRENT_DATE
);

/* Users can like playlist contributions */
CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  contribution INTEGER REFERENCES contributions(id) NOT NULL,
  user INTEGER REFERENCES users(id) NOT NULL,
  liked DATE NOT NULL DEFAULT CURRENT_DATE,
);