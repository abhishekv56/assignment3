class WeatherModel {
 final String name;
 final String desc;
 final num celsius;

 WeatherModel({ required this.name, required this.desc, required this.celsius,});

 factory WeatherModel.fromMap(Map<String, dynamic> map){
   return WeatherModel(
       name: map['name'],
       desc: map['weather'][0]['description'],
       celsius: map['main']['temp']
   );
 }
}