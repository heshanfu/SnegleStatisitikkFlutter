/// Controller to mutate and query a MongoDB with graphql
class APIController {
  /// Used to add the correct variables to the mutation string addFindingsMutation in [Mutations]
  static addFinding(String kommune, String fylke, int count)  {

    var _dateNow = DateTime.now();
    var _date = '${_dateNow.day}.${_dateNow.month}.${_dateNow.year}';
    var _hour = _dateNow.hour + 1 < 10 ? '0${_dateNow.hour + 1}' : '${_dateNow.hour + 1}'; //  +1 to correct from UTC time.
    var _minutes = _dateNow.minute < 10 ? '0${_dateNow.minute}' : '${_dateNow.minute}';
    return  {
              'kommune': kommune,
              'fylke': fylke,
              'count': count,
              'date': _date,
              'time': '$_hour:$_minutes'
            };
  }

  static queryFindingByFylke(String fylke) {
    return {
      'fylke': fylke
    };
  }

  static queryFindingByKommune(String kommune)  {
    return {
      'kommune': kommune
    };
  } 
  
  // Example: "14.12.2019"
  static queryFindingByDate(String date)  {
    return {
      'date': date
    };
  }
  // Example: "13:55"
  static queryFindingByTime(String time)  {

  }

  static queryAverageFindingTime() {

  }

  static queryMostFindingsDate() {

  }

  static queryMostFindingsKommune() {

  }

  static queryMostFindingsFylke() {

  }

  static queryFindingsPerDay()  {

  }

}