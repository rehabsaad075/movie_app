class WatchProviderModel {
  int? id;
  Results? results;

  WatchProviderModel({this.id, this.results});

  WatchProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    results =
    json['results'] != null ?  Results.fromJson(json['results']) : null;
  }


}

class Results {
  EG? eG;
  US? us;

  Results(
      {
        this.eG,
        this.us
});

  Results.fromJson(Map<String, dynamic> json) {
    eG = json['EG'] != null ?  EG.fromJson(json['EG']) : null;
    us = json['US'] != null ?  US.fromJson(json['US']) : null;
  }

}

class EG {
  String? link;
  List<Rent>? rent;
  List<Buy>? buy;
  List<Flatrate>? flatrate;

  EG({this.link, this.rent, this.buy, this.flatrate});

  EG.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['rent'] != null) {
      rent = <Rent>[];
      json['rent'].forEach((v) {
        rent!.add( Rent.fromJson(v));
      });
    }
    if (json['buy'] != null) {
      buy = <Buy>[];
      json['buy'].forEach((v) {
        buy!.add( Buy.fromJson(v));
      });
    }
    if (json['flatrate'] != null) {
      flatrate = <Flatrate>[];
      json['flatrate'].forEach((v) {
        flatrate!.add( Flatrate.fromJson(v));
      });
    }
  }

}
class US {
  String? link;
  List<Rent>? rent;
  List<Buy>? buy;

  US({this.link, this.rent, this.buy,});

  US.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['rent'] != null) {
      rent = <Rent>[];
      json['rent'].forEach((v) {
        rent!.add( Rent.fromJson(v));
      });
    }
    if (json['buy'] != null) {
      buy = <Buy>[];
      json['buy'].forEach((v) {
        buy!.add( Buy.fromJson(v));
      });
    }
  }

}

class Rent {
  String? logoPath;
  int? providerId;
  String? providerName;
  int? displayPriority;

  Rent(
      {this.logoPath,
        this.providerId,
        this.providerName,
        this.displayPriority});

  Rent.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    displayPriority = json['display_priority'];
  }

}

class Buy{
  String ?logoPath;
  String ?providerName;
  Buy(
      this.logoPath,
      this.providerName
      );
  Buy.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    providerName = json['provider_name'];

  }
}
class Flatrate{
  String ?logoPath;
  String ?providerName;
  Flatrate(
      this.logoPath,
      this.providerName
      );
  Flatrate.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    providerName = json['provider_name'];

  }
}