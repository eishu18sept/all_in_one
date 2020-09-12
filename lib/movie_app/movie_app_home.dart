import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const apiKey = "6d3696e1";

class MovieApp extends StatefulWidget {
  static String id = 'movie_app' ;

  MovieApp({Key key}) : super(key: key);

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  
  String movieInfo = "";
  String movieName = "" ;
  String title = "" ;
  String releaseDate = "" ;
  String runtime = "" ;
  String genre = "" ;
  String actors = "" ;
  String director = "" ;
  String imdbRating = "" ;

  void getMovie(movieName) async{
    var url = await Dio().get("http://www.omdbapi.com/?apikey=$apiKey&t=$movieName");
    title = url.data['Title'];
    movieInfo = url.data['Plot'];
    releaseDate = url.data['Released'];
    runtime = url.data['Runtime'];
    genre = url.data['Genre'];
    actors = url.data['Actors'];
    director = url.data['Director'];
    imdbRating = url.data['imdbRating'];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Movie Info"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
        ), 
      ),
      backgroundColor: Colors.green[200],
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value){
                        setState(() {
                          movieName = value ;
                        });
                      },
                    ),
                  ),
                ),
              ),
              RaisedButton(
                elevation: 10.0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.red,
                  )
                ),
                onPressed: (){
                  setState(() {
                    getMovie(movieName);
                  });
                },
                child: Text(
                  "Search for your movie",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),  
              ),
              Container(
                height: MediaQuery.of(context).size.width * 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Scrollbar(
                      child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10.0),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "$title" ,
                              maxLines: 8,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              " $movieInfo \n",
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              "IMDB : $imdbRating \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Genre : $genre \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "Actors : $actors \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "Director : $director \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            Text("Released Date : $releaseDate \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            Text("Runtime : $runtime \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}