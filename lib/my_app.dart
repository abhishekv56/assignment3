import 'package:assignment3/Models/weather_model.dart';
import 'package:assignment3/news_screen.dart';
import 'package:assignment3/services.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final city=TextEditingController();

  WeatherService service = WeatherService();

  WeatherModel? weatherData;

  Future<WeatherModel> getWeatherData() async {
    final data= await service.fetchWeather(city.text);
    setState(() {
    });
    weatherData =  WeatherModel.fromMap(data);
    return weatherData!;

  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text('News and Weather') ,
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                    children:[
                     //Center(child: Text('Tab 1'),),
                      NewsScreen(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                  child: Image.asset('assets/weather_img.png'),
                                clipBehavior: Clip.hardEdge,
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: city,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,color: Colors.deepPurple,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  label: Text('Search Weather by City Name',style: TextStyle(fontSize: 14),),
                                  suffixIcon:  Container(
                                    margin: EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(70, 50),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: Text("Search"),
                                      onPressed: () {
                                        getWeatherData();

                                      },
                                    ),
                                  ),

                                ),

                              ),
                              SizedBox(height: 30,),
                              weatherData==null?
                                  Text('no data')
                                  :
                              Column(
                                children: [
                                  Text(weatherData!.name,style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 15,),
                                  Text('${weatherData!.celsius} C',style: TextStyle(fontSize: 32),),
                                  SizedBox(height: 15,),
                                  Text(weatherData!.desc,style: TextStyle(fontSize: 20),)
                                ],
                              )

                            ],
                          ),
                        ),
                      )
                    ]
                ),
              )
            ],
          ),
          bottomNavigationBar:TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.newspaper,color: Colors.deepPurple,),
                  child: Text('News',style: TextStyle(color: Colors.deepPurple),),
                ),
                Tab(
                  icon: Icon(Icons.sunny_snowing,color: Colors.deepPurple,),
                  child: Text('Weather', style: TextStyle(color: Colors.deepPurple),),
                )
              ]
          ),
        ),
      ),
    );
  }
}
