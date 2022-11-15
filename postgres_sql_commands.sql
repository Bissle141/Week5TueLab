CREATE TABLE Users (
	user_id serial PRIMARY KEY NOT NULL,
	email varchar(50) NOT NULL UNIQUE,
	username varchar(20) NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE Occasions (
	occasion_id serial PRIMARY KEY NOT NULL,
	user_id integer  NOT NULL,
	occasion_name varchar(20) NOT NULL,
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);


CREATE TABLE Recipes (
	recipes_id serial PRIMARY KEY NOT NULL,
	user_id serial NOT NULL,
	instructions TEXT NOT NULL,
	share_status BOOLEAN NOT NULL DEFAULT 'true',
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);


CREATE TABLE Occasion_recipes (
	occasion_recipes_id serial PRIMARY KEY NOT NULL,
	occasion_id integer NOT NULL,
	recipe_id integer NOT NULL,
	FOREIGN KEY(occasion_id) REFERENCES Occasions(occasion_id),
	FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id)
);


CREATE TABLE Ingredients (
	ingredient_id serial PRIMARY KEY NOT NULL,
	recipe_id integer NOT NULL,
	ingredient varchar(20) NOT NULL,
	FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id)
);


CREATE TABLE GroceryList (
	gocery_id serial PRIMARY KEY NOT NULL,
	user_id integer NOT NULL,
	recipe_id integer NOT NULL,
	ingredient_id integer NOT NULL,
	item varchar(20) NOT NULL,
	quantity integer NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id),
	FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);


