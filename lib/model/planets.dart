class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;
  final String picture;

  const Planet({this.id, this.name, this.location, this.distance, this.gravity,
    this.description, this.image, this.picture});
}

List<Planet> planets = [
  const Planet(
    id: "1",
    name: "Earth Quake",
    location: "Albany, NY",
    distance: "Possible Threat",
    gravity: "",
    description: "Earth quakes are dangerous",
    image: "assets/img/mars.png",
    picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
  ),
  const Planet(
    id: "2",
    name: "Tsunami",
    location: "Calafornia",
    distance: "Happening Right Now",
    gravity: "3.711 m/s ",
    description: "Tsunmais are dangerous af",
    image: "assets/img/neptune.png",
    picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
  ),
  const Planet(
    id: "3",
    name: "Blizzard",
    location: "Maine",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "The Moon is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). Following Jupiter's satellite Io, the Moon is second-densest satellite among those whose densities are known.",
    image: "assets/img/moon.png",
    picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
  ),
  const Planet(
    id: "4",
    name: "Volcanoe",
    location: "Wisconsin",
    distance: "Low Priority",
    gravity: "3.711 m/s ",
    description: "Earth is the third planet from the Sun and the only object in the Universe known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth revolves around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times.",
    image: "assets/img/earth.png",
    picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
  ),
  const Planet(
    id: "5",
    name: "IDK",
    location: "My house chigga",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period around the Sun of 88 days is the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger to the gods.",
    image: "assets/img/mercury.png",
    picture: "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg"
  ),
];