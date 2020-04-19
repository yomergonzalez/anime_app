class AnimeList {
  List<Data> data;
  Meta meta;
  Links links;

  AnimeList({this.data, this.meta, this.links});

  AnimeList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
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

class Data {
  String id;
  String type;
  Links links;
  Attributes attributes;
  Relationships relationships;

  Data({this.id, this.type, this.links, this.attributes, this.relationships});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? new Relationships.fromJson(json['relationships'])
        : null;
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
  String slug;
  String synopsis;
  int coverImageTopOffset;
  Titles titles;
  String canonicalTitle;
  List<String> abbreviatedTitles;
  String averageRating;
  RatingFrequencies ratingFrequencies;
  int userCount;
  int favoritesCount;
  String startDate;
  String endDate;
  String nextRelease;
  int popularityRank;
  int ratingRank;
  String ageRating;
  String ageRatingGuide;
  String subtype;
  String status;
  String tba;
  PosterImage posterImage;
  CoverImage coverImage;
  int episodeCount;
  int episodeLength;
  int totalLength;
  String youtubeVideoId;
  String showType;
  bool nsfw;

  Attributes(
      {this.createdAt,
        this.updatedAt,
        this.slug,
        this.synopsis,
        this.coverImageTopOffset,
        this.titles,
        this.canonicalTitle,
        this.abbreviatedTitles,
        this.averageRating,
        this.ratingFrequencies,
        this.userCount,
        this.favoritesCount,
        this.startDate,
        this.endDate,
        this.nextRelease,
        this.popularityRank,
        this.ratingRank,
        this.ageRating,
        this.ageRatingGuide,
        this.subtype,
        this.status,
        this.tba,
        this.posterImage,
        this.coverImage,
        this.episodeCount,
        this.episodeLength,
        this.totalLength,
        this.youtubeVideoId,
        this.showType,
        this.nsfw});

  Attributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    synopsis = json['synopsis'];
    coverImageTopOffset = json['coverImageTopOffset'];
    titles =
    json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    canonicalTitle = json['canonicalTitle'];
    abbreviatedTitles = json['abbreviatedTitles'].cast<String>();
    averageRating = json['averageRating'];
    ratingFrequencies = json['ratingFrequencies'] != null
        ? new RatingFrequencies.fromJson(json['ratingFrequencies'])
        : null;
    userCount = json['userCount'];
    favoritesCount = json['favoritesCount'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    nextRelease = json['nextRelease'];
    popularityRank = json['popularityRank'];
    ratingRank = json['ratingRank'];
    ageRating = json['ageRating'];
    ageRatingGuide = json['ageRatingGuide'];
    subtype = json['subtype'];
    status = json['status'];
    tba = json['tba'];
    posterImage = json['posterImage'] != null
        ? new PosterImage.fromJson(json['posterImage'])
        : null;
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    episodeCount = json['episodeCount'];
    episodeLength = json['episodeLength'];
    totalLength = json['totalLength'];
    youtubeVideoId = json['youtubeVideoId'];
    showType = json['showType'];
    nsfw = json['nsfw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['synopsis'] = this.synopsis;
    data['coverImageTopOffset'] = this.coverImageTopOffset;
    if (this.titles != null) {
      data['titles'] = this.titles.toJson();
    }
    data['canonicalTitle'] = this.canonicalTitle;
    data['abbreviatedTitles'] = this.abbreviatedTitles;
    data['averageRating'] = this.averageRating;
    if (this.ratingFrequencies != null) {
      data['ratingFrequencies'] = this.ratingFrequencies.toJson();
    }
    data['userCount'] = this.userCount;
    data['favoritesCount'] = this.favoritesCount;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['nextRelease'] = this.nextRelease;
    data['popularityRank'] = this.popularityRank;
    data['ratingRank'] = this.ratingRank;
    data['ageRating'] = this.ageRating;
    data['ageRatingGuide'] = this.ageRatingGuide;
    data['subtype'] = this.subtype;
    data['status'] = this.status;
    data['tba'] = this.tba;
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage.toJson();
    }
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage.toJson();
    }
    data['episodeCount'] = this.episodeCount;
    data['episodeLength'] = this.episodeLength;
    data['totalLength'] = this.totalLength;
    data['youtubeVideoId'] = this.youtubeVideoId;
    data['showType'] = this.showType;
    data['nsfw'] = this.nsfw;
    return data;
  }
}

class Titles {
  String en;
  String enJp;
  String jaJp;
  String enUs;

  Titles({this.en, this.enJp, this.jaJp, this.enUs});

  Titles.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    enJp = json['en_jp'];
    jaJp = json['ja_jp'];
    enUs = json['en_us'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['en_jp'] = this.enJp;
    data['ja_jp'] = this.jaJp;
    data['en_us'] = this.enUs;
    return data;
  }
}

class RatingFrequencies {
  String s2;
  String s3;
  String s4;
  String s5;
  String s6;
  String s7;
  String s8;
  String s9;
  String s10;
  String s11;
  String s12;
  String s13;
  String s14;
  String s15;
  String s16;
  String s17;
  String s18;
  String s19;
  String s20;

  RatingFrequencies(
      {this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s9,
        this.s10,
        this.s11,
        this.s12,
        this.s13,
        this.s14,
        this.s15,
        this.s16,
        this.s17,
        this.s18,
        this.s19,
        this.s20});

  RatingFrequencies.fromJson(Map<String, dynamic> json) {
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['17'] = this.s17;
    data['18'] = this.s18;
    data['19'] = this.s19;
    data['20'] = this.s20;
    return data;
  }
}

class PosterImage {
  String tiny;
  String small;
  String medium;
  String large;
  String original;
  Meta meta;

  PosterImage(
      {this.tiny,
        this.small,
        this.medium,
        this.large,
        this.original,
        this.meta});

  PosterImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    original = json['original'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tiny'] = this.tiny;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['original'] = this.original;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Meta {
  _Dimensions dimensions;

  Meta({this.dimensions});

  Meta.fromJson(Map<String, dynamic> json) {
    dimensions = json['dimensions'] != null
        ? new _Dimensions.fromJson(json['dimensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions.toJson();
    }
    return data;
  }
}

class Tiny {
  int width;
  int height;

  Tiny({this.width, this.height});

  Tiny.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class CoverImage {
  String tiny;
  String small;
  String large;
  String original;
  Meta meta;

  CoverImage({this.tiny, this.small, this.large, this.original, this.meta});

  CoverImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    small = json['small'];
    large = json['large'];
    original = json['original'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tiny'] = this.tiny;
    data['small'] = this.small;
    data['large'] = this.large;
    data['original'] = this.original;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class _Dimensions {
  Tiny tiny;
  Tiny small;
  Tiny large;

  _Dimensions({this.tiny, this.small, this.large});

  _Dimensions.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'] != null ? new Tiny.fromJson(json['tiny']) : null;
    small = json['small'] != null ? new Tiny.fromJson(json['small']) : null;
    large = json['large'] != null ? new Tiny.fromJson(json['large']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tiny != null) {
      data['tiny'] = this.tiny.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    return data;
  }
}

class Relationships {
  Genres genres;
  Genres categories;
  Genres castings;
  Genres installments;
  Genres mappings;
  Genres reviews;
  Genres mediaRelationships;
  Genres characters;
  Genres staff;
  Genres productions;
  Genres quotes;
  Genres episodes;
  Genres streamingLinks;
  Genres animeProductions;
  Genres animeCharacters;
  Genres animeStaff;

  Relationships(
      {this.genres,
        this.categories,
        this.castings,
        this.installments,
        this.mappings,
        this.reviews,
        this.mediaRelationships,
        this.characters,
        this.staff,
        this.productions,
        this.quotes,
        this.episodes,
        this.streamingLinks,
        this.animeProductions,
        this.animeCharacters,
        this.animeStaff});

  Relationships.fromJson(Map<String, dynamic> json) {
    genres =
    json['genres'] != null ? new Genres.fromJson(json['genres']) : null;
    categories = json['categories'] != null
        ? new Genres.fromJson(json['categories'])
        : null;
    castings =
    json['castings'] != null ? new Genres.fromJson(json['castings']) : null;
    installments = json['installments'] != null
        ? new Genres.fromJson(json['installments'])
        : null;
    mappings =
    json['mappings'] != null ? new Genres.fromJson(json['mappings']) : null;
    reviews =
    json['reviews'] != null ? new Genres.fromJson(json['reviews']) : null;
    mediaRelationships = json['mediaRelationships'] != null
        ? new Genres.fromJson(json['mediaRelationships'])
        : null;
    characters = json['characters'] != null
        ? new Genres.fromJson(json['characters'])
        : null;
    staff = json['staff'] != null ? new Genres.fromJson(json['staff']) : null;
    productions = json['productions'] != null
        ? new Genres.fromJson(json['productions'])
        : null;
    quotes =
    json['quotes'] != null ? new Genres.fromJson(json['quotes']) : null;
    episodes =
    json['episodes'] != null ? new Genres.fromJson(json['episodes']) : null;
    streamingLinks = json['streamingLinks'] != null
        ? new Genres.fromJson(json['streamingLinks'])
        : null;
    animeProductions = json['animeProductions'] != null
        ? new Genres.fromJson(json['animeProductions'])
        : null;
    animeCharacters = json['animeCharacters'] != null
        ? new Genres.fromJson(json['animeCharacters'])
        : null;
    animeStaff = json['animeStaff'] != null
        ? new Genres.fromJson(json['animeStaff'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.toJson();
    }
    if (this.castings != null) {
      data['castings'] = this.castings.toJson();
    }
    if (this.installments != null) {
      data['installments'] = this.installments.toJson();
    }
    if (this.mappings != null) {
      data['mappings'] = this.mappings.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.toJson();
    }
    if (this.mediaRelationships != null) {
      data['mediaRelationships'] = this.mediaRelationships.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
    if (this.staff != null) {
      data['staff'] = this.staff.toJson();
    }
    if (this.productions != null) {
      data['productions'] = this.productions.toJson();
    }
    if (this.quotes != null) {
      data['quotes'] = this.quotes.toJson();
    }
    if (this.episodes != null) {
      data['episodes'] = this.episodes.toJson();
    }
    if (this.streamingLinks != null) {
      data['streamingLinks'] = this.streamingLinks.toJson();
    }
    if (this.animeProductions != null) {
      data['animeProductions'] = this.animeProductions.toJson();
    }
    if (this.animeCharacters != null) {
      data['animeCharacters'] = this.animeCharacters.toJson();
    }
    if (this.animeStaff != null) {
      data['animeStaff'] = this.animeStaff.toJson();
    }
    return data;
  }
}

class Genres {
  Links links;

  Genres({this.links});

  Genres.fromJson(Map<String, dynamic> json) {
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
