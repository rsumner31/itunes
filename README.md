<<<<<<< HEAD
Tunes [![Build Status](https://secure.travis-ci.org/dewski/itunes.png)](http://travis-ci.org/dewski/itunes)
======

A Ruby wrapper around the iTunes API that lets you search for any sort of data that is available on the iTunes store.

Example Response
----------------

    {
      "artist_id" : 954266,
      "artist_name" : "Green Day",
      "artist_view_url" : "http://itunes.apple.com/us/artist/green-day/id954266?uo=4",
      "artwork_url100" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.100x100-75.jpg",
      "artwork_url30" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.30x30-50.jpg",
      "artwork_url60" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.60x60-50.jpg",
      "collection_censored_name" : "Dookie",
      "collection_explicitness" : "explicit",
      "collection_id" : 5132583,
      "collection_name" : "Dookie",
      "collection_price" : 9.99,
      "collection_view_url" : "http://itunes.apple.com/us/album/she/id5132583?i=5132563&uo=4",
      "content_advisory_rating" : null,
      "country" : "USA",
      "currency" : "USD",
      "disc_count" : 1,
      "disc_number" : 1,
      "kind" : "song",
      "preview_url" : "http://a1.phobos.apple.com/us/r1000/027/Music/0e/86/7a/mzm.wchstext.aac.p.m4a",
      "primary_genre_name" : "Alternative",
      "release_date" : "2003-04-22 07:00:00 Etc/GMT",
      "track_censored_name" : "She",
      "track_count" : 15,
      "track_explicitness" : "notExplicit",
      "track_id" : 5132563,
      "track_name" : "She",
      "track_number" : 8,
      "track_price" : 1.29,
      "track_time_millis" : 134293,
      "track_view_url" : "http://itunes.apple.com/us/album/she/id5132583?i=5132563&uo=4",
      "wrapper_type" : "track"
    }

Available Methods
-----------------

* movie
* podcast
* music
* music_video
* audiobook
* short_film
* tv_show
* ebook
* software
* all

Using the Tunes gem
--------------------

    require 'tunes'

    >> tunes = Tunes::Client.new
    >> songs = tunes.music('green day she')
    => <#Hashie::Rash result_count=15 results=[...]>
    >> songs.results.each do |song|
    >>   puts "#{song.track_name} - #{song.artist_name} (#{song.collection_name})"
    >> end
    => She - Green Day (Dookie)
    => She - Green Day (Dookie)
    => She - Green Day (Dookie)
    => She - Green Day (Dookie)
    => She - Green Day (Dookie)

Search directly from the class

    >> iron_man = Tunes.movie('iron man 2')
    => <#Hashie::Rash result_count=1 results=[...]>

Limit the results:

    >> foo_fighters = Tunes.music('foo fighters everlong', :limit => 1)
    => <#Hashie::Rash result_count=1 results=[<#Hashie::Rash ...>]>

What is Hashie::Rash?

If you are familiar with Hashie, Rash is very similar to a Mash.  The primary difference is that Rash gives us ruby-friendly keys so instead of artistId, Rash converts that to artist_id.

Copyright
---------

Copyright © 2011 Garrett Bjerkhoel, Steve Agalloco. See [MIT-LICENSE](http://github.com/dewski/itunes/blob/master/MIT-LICENSE) for details.
=======
# iTunes
A Ruby wrapper around the iTunes API that lets you search for any sort of data that is available on the iTunes store.

## Example Response

    {
      "artistId" : 954266,
      "artistName" : "Green Day",
      "artistViewUrl" : "http://itunes.apple.com/us/artist/green-day/id954266?uo=4",
      "artworkUrl100" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.100x100-75.jpg",
      "artworkUrl30" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.30x30-50.jpg",
      "artworkUrl60" : "http://a1.phobos.apple.com/us/r1000/049/Features/1e/17/05/dj.rpihtiig.60x60-50.jpg",
      "collectionCensoredName" : "Dookie",
      "collectionExplicitness" : "explicit",
      "collectionId" : 5132583,
      "collectionName" : "Dookie",
      "collectionPrice" : 9.99,
      "collectionViewUrl" : "http://itunes.apple.com/us/album/she/id5132583?i=5132563&uo=4",
      "contentAdvisoryRating" : null,
      "country" : "USA",
      "currency" : "USD",
      "discCount" : 1,
      "discNumber" : 1,
      "kind" : "song",
      "previewUrl" : "http://a1.phobos.apple.com/us/r1000/027/Music/0e/86/7a/mzm.wchstext.aac.p.m4a",
      "primaryGenreName" : "Alternative",
      "releaseDate" : "2003-04-22 07:00:00 Etc/GMT",
      "trackCensoredName" : "She",
      "trackCount" : 15,
      "trackExplicitness" : "notExplicit",
      "trackId" : 5132563,
      "trackName" : "She",
      "trackNumber" : 8,
      "trackPrice" : 1.29,
      "trackTimeMillis" : 134293,
      "trackViewUrl" : "http://itunes.apple.com/us/album/she/id5132583?i=5132563&uo=4",
      "wrapperType" : "track"
    }

## Available Methods
   - movie
   - podcast
   - music
   - music_video
   - audiobook
   - short_film
   - tv_show
   - all

## Using the iTunes gem

    require 'itunes'
    
    >> itunes = ITunes.new
    >> songs = itunes.music('green day she')
    => {"result_count" => 15, "results" => [...]}
    >> iron_man = ITunes.movie('iron man 2')
    => {"result_count" => 1, "results" => [...]}

## Upcoming Features

- Set a max number of results, currently returns all.
- A better DSL.

## Copyright
Copyright © 2010 Garrett Bjerkhoel. See [MIT-LICENSE](http://github.com/dewski/itunes/blob/master/MIT-LICENSE) for details.
>>>>>>> b994aea... added a readme
