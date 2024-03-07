class UsaPopulationModel {
  List<Data>? data;
  List<Source>? source;

  UsaPopulationModel({this.data, this.source});

  UsaPopulationModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    source = json["source"] == null
        ? null
        : (json["source"] as List).map((e) => Source.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if (source != null) {
      _data["source"] = source?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Source {
  List<String>? measures;
  Annotations? annotations;
  String? name;
  List<dynamic>? substitutions;

  Source({this.measures, this.annotations, this.name, this.substitutions});

  Source.fromJson(Map<String, dynamic> json) {
    measures =
        json["measures"] == null ? null : List<String>.from(json["measures"]);
    annotations = json["annotations"] == null
        ? null
        : Annotations.fromJson(json["annotations"]);
    name = json["name"];
    substitutions = json["substitutions"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (measures != null) {
      _data["measures"] = measures;
    }
    if (annotations != null) {
      _data["annotations"] = annotations?.toJson();
    }
    _data["name"] = name;
    if (substitutions != null) {
      _data["substitutions"] = substitutions;
    }
    return _data;
  }
}

class Annotations {
  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;

  Annotations(
      {this.sourceName,
      this.sourceDescription,
      this.datasetName,
      this.datasetLink,
      this.tableId,
      this.topic,
      this.subtopic});

  Annotations.fromJson(Map<String, dynamic> json) {
    sourceName = json["source_name"];
    sourceDescription = json["source_description"];
    datasetName = json["dataset_name"];
    datasetLink = json["dataset_link"];
    tableId = json["table_id"];
    topic = json["topic"];
    subtopic = json["subtopic"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["source_name"] = sourceName;
    _data["source_description"] = sourceDescription;
    _data["dataset_name"] = datasetName;
    _data["dataset_link"] = datasetLink;
    _data["table_id"] = tableId;
    _data["topic"] = topic;
    _data["subtopic"] = subtopic;
    return _data;
  }
}

class Data {
  String? idNation;
  String? nation;
  int? idYear;
  String? year;
  int? population;
  String? slugNation;

  Data(
      {this.idNation,
      this.nation,
      this.idYear,
      this.year,
      this.population,
      this.slugNation});

  Data.fromJson(Map<String, dynamic> json) {
    idNation = json["ID Nation"];
    nation = json["Nation"];
    idYear = json["ID Year"];
    year = json["Year"];
    population = json["Population"];
    slugNation = json["Slug Nation"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ID Nation"] = idNation;
    _data["Nation"] = nation;
    _data["ID Year"] = idYear;
    _data["Year"] = year;
    _data["Population"] = population;
    _data["Slug Nation"] = slugNation;
    return _data;
  }
}
