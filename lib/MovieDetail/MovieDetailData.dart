
class MovieDetailData {
  final Rating rating;
  final int collectCount;
  final ImageURLs imageURLs;
  final String year;
  final List<Comment> comments;
  final String alt;
  final String id;
  final String mobileUrl;
  final String title;
  final List<String> languages;
  final String scheduleUrl;
  final List<Person> writers;
  final List<String> tags;
  final List<String> durations;
  final List<String> genres;
  final bool hasTicket;
  final List<Person> casts;
  final List<String> countries;
  final String mainlandPubdate;
  final List<Photo> photos;
  final String summary;
  final String subtype;
  final List<Person> directors;
  final List<Review> popularReviews;
  final int ratingsCount;
  final List<String> aka;
  final int wishCount;
  
  MovieDetailData({this.rating,this.collectCount,this.imageURLs,
                  this.year,this.comments,this.alt,this.id,this.mobileUrl,
                  this.title,this.languages,this.scheduleUrl,this.writers,
                  this.tags,this.durations,this.genres,this.hasTicket,
                  this.casts,this.countries,this.mainlandPubdate,this.photos,
                  this.summary,this.subtype,this.directors,this.popularReviews,
                  this.ratingsCount,this.aka,this.wishCount});
  
  factory MovieDetailData.fromJson(Map<String,dynamic> json) {
    
    Rating rating = Rating.fromJson(json['rating']);
    ImageURLs imageURLs = ImageURLs.fromJson(json['images']);

    //List<Comment> List<Photo>
    List<Comment> comments = List();
    for (dynamic commentData in json['popular_comments']) {
      Comment comment = Comment.fromJson(commentData);
      comments.add(comment);
    }

    List<Photo> photos = List();
    for (dynamic photoData in json['photos']) {
      Photo photo = Photo.fromJson(photoData);
      photos.add(photo);
    }

    List<Review> popularReviews = List();
    for (dynamic reviewData in json['popular_reviews']) {
      Review review = Review.fromJson(reviewData);
      popularReviews.add(review);
    }

    //List<Person> -------------------------------
    List<Person> writers = List();
    for (dynamic personData in json['writers']) {
      Person writer = Person.fromJson(personData);
      writers.add(writer);
    }
    List<Person> casts = List();
    for (dynamic personData in json['casts']) {
      Person cast = Person.fromJson(personData);
      casts.add(cast);
    }
    List<Person> directors = List();
    for (dynamic personData in json['directors']) {
      Person director = Person.fromJson(personData);
      directors.add(director);
    }
    //List<String> -------------------------------
    List<String> languages = List();
    for (String language in json['languages']) {
      languages.add(language);
    }
    List<String> tags = List();
    for (String tag in json['tags']) {
      tags.add(tag);
    }
    List<String> durations = List();
    for (String duration in json['durations']) {
      durations.add(duration);
    }
    List<String> genres = List();
    for (String genre in json['genres']) {
      genres.add(genre);
    }
    List<String> countries = List();
    for (String country in json['countries']) {
      countries.add(country);
    }
    List<String> aka = List();
    for (String item in json['aka']) {
      aka.add(item);
    }

    return MovieDetailData(
      rating: rating,
      collectCount: json['collect_count'] as int,
      imageURLs: imageURLs,
      year: json['year'] as String,
      comments: comments,
      alt: json['alt'] as String,
      id: json['id'] as String,
      mobileUrl: json['mobile_url'] as String,
      title: json['title'] as String,
      languages: languages,
      scheduleUrl: json['schedule_url'] as String,
      writers: writers,
      tags: tags,
      durations: durations,
      genres: genres,
      hasTicket: json['has_ticket'] as bool,
      casts: casts,
      countries: countries,
      mainlandPubdate: json['mainland_pubdate'] as String,
      photos: photos,
      summary: json['summary'] as String,
      subtype: json['subtype'] as String,
      directors: directors,
      popularReviews: popularReviews,
      ratingsCount: json['ratings_count'] as int,
      aka: aka,
      wishCount: json['wish_count'] as int,
    );
  }
}


class Rating {
  final int max;
  final double average;
  final int min;
  final double value;
  final Map details;

  Rating({this.max,this.average,this.min,this.value,this.details});

  factory Rating.fromJson(Map<String,dynamic> json) {
    return Rating(
      max: json['max'] as int,
      average: json['average'] as double,
      min: json['min'] as int,
      value: json['value'] as double,
      details: json['details'] as Map,
    );
  }
}


class ImageURLs {
  final String smallURL;
  final String largeURL;
  final String mediumURL;

  ImageURLs({this.smallURL,this.largeURL,this.mediumURL});

  factory ImageURLs.fromJson(Map<String,dynamic> json) {
    return ImageURLs(
      smallURL: json['small'] as String,
      largeURL: json['large'] as String,
      mediumURL: json['medium'] as String,
    );
  }
}


class Comment {
  final Rating rating;
  final int usefulCount;
  final Author author;
  final String subjectId;
  final String content;
  final String createdAt;
  final String id;

  Comment({this.rating,this.usefulCount,this.author,this.subjectId,this.content,this.createdAt,this.id});

  factory Comment.fromJson(Map<String,dynamic> json) {
    return Comment(
      rating:Rating.fromJson(json['rating']),
      usefulCount: json['useful_count'] as int,
      author: Author.fromJson(json['author']),
      subjectId: json['subject_id'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as String,
    );
  }

}

class Review {
  final Rating rating;
  final String title;
  final String subjectId;
  final Author author;
  final String summary;  
  final String alt;
  final String id;

  Review({this.rating,this.title,this.subjectId,this.author,this.summary,this.alt,this.id});

  factory Review.fromJson(Map<String,dynamic> json) {
    return Review(
      rating:Rating.fromJson(json['rating']),
      title: json['title'] as String,
      subjectId: json['subject_id'] as String,
      author: Author.fromJson(json['author']),
      summary: json['summary'] as String,
      alt: json['alt'] as String,
      id: json['id'] as String,
    );
  }

}


class Author {
  final String uid;
  final String avatar;
  final String signature;
  final String alt;
  final String id;
  final String name;

  Author({this.uid,this.avatar,this.signature,this.alt,this.id,this.name});

  factory Author.fromJson(Map<String,dynamic> json) {
    return Author(
      uid: json['uid'] as String,
      avatar: json['avatar'] as String,
      signature: json['signature'] as String,
      alt: json['alt'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

}


class Person {
  final Avatars avatars;
  final String nameEn;
  final String name;
  final String alt;
  final String id;

  Person({this.avatars,this.nameEn,this.name,this.alt,this.id});

  factory Person.fromJson(Map<String,dynamic> json) {
    return Person(
      avatars: Avatars.fromJson(json['avatars']),
      nameEn: json['name_en'] as String,
      name: json['name'] as String,
      alt: json['alt'] as String,
      id: json['id'] as String,
    );
  }
}

class Avatars {
  final String small;
  final String large;
  final String medium;

  Avatars({this.small,this.large,this.medium});

  factory Avatars.fromJson(Map<String,dynamic> json) {
    return Avatars(
      small: json['small'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
    );
  }
}

class Photo {
  final String thumb;
  final String image;
  final String cover;
  final String alt;
  final String id;
  final String icon;
  
  Photo({this.thumb,this.image,this.cover,this.alt,this.id,this.icon});

  factory Photo.fromJson(Map<String,dynamic> json) {
    return Photo(
      thumb: json['thumb'] as String,
      image: json['image'] as String,
      cover: json['cover'] as String,
      alt: json['alt'] as String,
      id: json['id'] as String,
      icon: json['icon'] as String,
    );
  }
}