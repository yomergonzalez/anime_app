class Episodes {
  List<DataList> data;
  Meta meta;
  Links links;

  Episodes({this.data, this.meta, this.links});

  Episodes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataList>();
      json['data'].forEach((v) { data.add(new DataList.fromJson(v)); });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class DataList {
  String id;
  String type;
  Links links;
  Attributes attributes;
  Relationships relationships;

  DataList({this.id, this.type, this.links, this.attributes, this.relationships});

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
    relationships = json['relationships'] != null ? new Relationships.fromJson(json['relationships']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    if (this.relationships != null) {
      data['relationships'] = this.relationships.toJson();
    }
    return data;
  }
}

class Links {
  String self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    return data;
  }
}

class Attributes {
  String createdAt;
  String updatedAt;
  Titles titles;
  String canonicalTitle;
  int seasonNumber;
  int number;
  int relativeNumber;
  String synopsis;
  String airdate;
  int length;
  Thumbnail thumbnail;

  Attributes({this.createdAt, this.updatedAt, this.titles, this.canonicalTitle, this.seasonNumber, this.number, this.relativeNumber, this.synopsis, this.airdate, this.length, this.thumbnail});

  Attributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titles = json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    canonicalTitle = json['canonicalTitle'];
    seasonNumber = json['seasonNumber'];
    number = json['number'];
    relativeNumber = json['relativeNumber'];
    synopsis = json['synopsis'];
    airdate = json['airdate'];
    length = json['length'];
    thumbnail = json['thumbnail'] != null ? new Thumbnail.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.titles != null) {
      data['titles'] = this.titles.toJson();
    }
    data['canonicalTitle'] = this.canonicalTitle;
    data['seasonNumber'] = this.seasonNumber;
    data['number'] = this.number;
    data['relativeNumber'] = this.relativeNumber;
    data['synopsis'] = this.synopsis;
    data['airdate'] = this.airdate;
    data['length'] = this.length;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

class Titles {
  String enJp;
  String enUs;
  String jaJp;

  Titles({this.enJp, this.enUs, this.jaJp});

  Titles.fromJson(Map<String, dynamic> json) {
    enJp = json['en_jp'];
    enUs = json['en_us'];
    jaJp = json['ja_jp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en_jp'] = this.enJp;
    data['en_us'] = this.enUs;
    data['ja_jp'] = this.jaJp;
    return data;
  }
}

class Thumbnail {
  String original;
  Meta meta;

  Thumbnail({this.original, this.meta});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Meta {
  Dimensions dimensions;

  Meta({this.dimensions});

  Meta.fromJson(Map<String, dynamic> json) {
    dimensions = json['dimensions'] != null ? new Dimensions.fromJson(json['dimensions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions.toJson();
    }
    return data;
  }
}

class Dimensions {
  Dimensions.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class Relationships {
  Media media;
  Media videos;

  Relationships({this.media, this.videos});

  Relationships.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    videos = json['videos'] != null ? new Media.fromJson(json['videos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.toJson();
    }
    return data;
  }
}

class Media {
  Links links;

  Media({this.links});

  Media.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}
