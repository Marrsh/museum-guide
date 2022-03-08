// import 'package:flutter/material.dart';

class museumModel {
  List<Data>? data;

  museumModel({this.data});

  museumModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  List<Categories>? categories;
  Attributes? attributes;

  Data({this.id, this.categories, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Categories {
  String? museum;
  String? name;
  String? value;

  Categories({this.museum, this.name, this.value});

  Categories.fromJson(Map<String, dynamic> json) {
    museum = json['museum'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['museum'] = this.museum;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Attributes {
  List<Description>? description;
  List<Multimedia>? multimedia;

  Attributes({this.description, this.multimedia});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(new Description.fromJson(v));
      });
    }
    if (json['multimedia'] != null) {
      multimedia = <Multimedia>[];
      json['multimedia'].forEach((v) {
        multimedia!.add(new Multimedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description!.map((v) => v.toJson()).toList();
    }
    if (this.multimedia != null) {
      data['multimedia'] = this.multimedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  bool? primary;
  String? type;
  String? value;

  Description({this.primary, this.type, this.value});

  Description.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Multimedia {
  Link? link;
  Admin? admin;
  String? credit;
  String? forSale;
  List<Identifier>? identifier;
  String? priority;
  Processed? processed;
  String? publicView;
  String? publish;
  String? sort;
  Source? source;
  String? trafficLight;
  Type? type;

  Multimedia(
      {this.link,
      this.admin,
      this.credit,
      this.forSale,
      this.identifier,
      this.priority,
      this.processed,
      this.publicView,
      this.publish,
      this.sort,
      this.source,
      this.trafficLight,
      this.type});

  Multimedia.fromJson(Map<String, dynamic> json) {
    link = json['@link'] != null ? new Link.fromJson(json['@link']) : null;
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    credit = json['credit'];
    forSale = json['for_sale'];
    if (json['identifier'] != null) {
      identifier = <Identifier>[];
      json['identifier'].forEach((v) {
        identifier!.add(new Identifier.fromJson(v));
      });
    }
    priority = json['priority'];
    processed = json['processed'] != null
        ? new Processed.fromJson(json['processed'])
        : null;
    publicView = json['public_view'];
    publish = json['publish'];
    sort = json['sort'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    trafficLight = json['traffic_light'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.link != null) {
      data['@link'] = this.link!.toJson();
    }
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    data['credit'] = this.credit;
    data['for_sale'] = this.forSale;
    if (this.identifier != null) {
      data['identifier'] = this.identifier!.map((v) => v.toJson()).toList();
    }
    data['priority'] = this.priority;
    if (this.processed != null) {
      data['processed'] = this.processed!.toJson();
    }
    data['public_view'] = this.publicView;
    data['publish'] = this.publish;
    data['sort'] = this.sort;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['traffic_light'] = this.trafficLight;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Link {
  String? type;

  Link({this.type});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

class Admin {
  String? id;
  String? source;
  String? uid;
  String? uuid;

  Admin({this.id, this.source, this.uid, this.uuid});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    uid = json['uid'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['uid'] = this.uid;
    data['uuid'] = this.uuid;
    return data;
  }
}

class Identifier {
  String? type;
  String? value;

  Identifier({this.type, this.value});

  Identifier.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Processed {
  LargeThumbnail? largeThumbnail;
  LargeThumbnail? large;

  Processed({this.largeThumbnail, this.large});

  Processed.fromJson(Map<String, dynamic> json) {
    largeThumbnail = json['large_thumbnail'] != null
        ? new LargeThumbnail.fromJson(json['large_thumbnail'])
        : null;
    large = json['large'] != null
        ? new LargeThumbnail.fromJson(json['large'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.largeThumbnail != null) {
      data['large_thumbnail'] = this.largeThumbnail!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    return data;
  }
}

class LargeThumbnail {
  String? format;
  String? location;
  bool? locationIsRelative;
  Measurements? measurements;
  int? modified;
  bool? resizable;
  String? type;

  LargeThumbnail(
      {this.format,
      this.location,
      this.locationIsRelative,
      this.measurements,
      this.modified,
      this.resizable,
      this.type});

  LargeThumbnail.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    location = json['location'];
    locationIsRelative = json['location_is_relative'];
    measurements = json['measurements'] != null
        ? new Measurements.fromJson(json['measurements'])
        : null;
    modified = json['modified'];
    resizable = json['resizable'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['location'] = this.location;
    data['location_is_relative'] = this.locationIsRelative;
    if (this.measurements != null) {
      data['measurements'] = this.measurements!.toJson();
    }
    data['modified'] = this.modified;
    data['resizable'] = this.resizable;
    data['type'] = this.type;
    return data;
  }
}

class Measurements {
  List<Dimensions>? dimensions;

  Measurements({this.dimensions});

  Measurements.fromJson(Map<String, dynamic> json) {
    if (json['dimensions'] != null) {
      dimensions = <Dimensions>[];
      json['dimensions'].forEach((v) {
        dimensions!.add(new Dimensions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dimensions {
  String? dimension;
  String? units;
  int? value;

  Dimensions({this.dimension, this.units, this.value});

  Dimensions.fromJson(Map<String, dynamic> json) {
    dimension = json['dimension'];
    units = json['units'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dimension'] = this.dimension;
    data['units'] = this.units;
    data['value'] = this.value;
    return data;
  }
}

class Source {
  Legal? legal;
  List<TitleJson>? title;

  Source({this.legal, this.title});

  Source.fromJson(Map<String, dynamic> json) {
    legal = json['legal'] != null ? new Legal.fromJson(json['legal']) : null;
    if (json['title'] != null) {
      title = <TitleJson>[];
      json['title'].forEach((v) {
        title!.add(new TitleJson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.legal != null) {
      data['legal'] = this.legal!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Legal {
  List<Rights>? rights;

  Legal({this.rights});

  Legal.fromJson(Map<String, dynamic> json) {
    if (json['rights'] != null) {
      rights = <Rights>[];
      json['rights'].forEach((v) {
        rights!.add(new Rights.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rights != null) {
      data['rights'] = this.rights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rights {
  String? details;
  String? usageTerms;

  Rights({this.details, this.usageTerms});

  Rights.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    usageTerms = json['usage_terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['usage_terms'] = this.usageTerms;
    return data;
  }
}

class Type {
  String? base;
  String? type;

  Type({this.base, this.type});

  Type.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['type'] = this.type;
    return data;
  }
}

class TitleJson {
  String? type;
  String? value;

  TitleJson({this.type, this.value});

  TitleJson.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
