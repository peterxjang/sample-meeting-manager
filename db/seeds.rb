# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Meeting.create(
  name: "First meeting with client",
  address: "Orleans Plaza, 414 N Orleans St, Chicago, IL 60654",
  start_time: DateTime.new(2016, 4, 26, 10),
  end_time: DateTime.new(2016, 4, 26, 10),
  notes: "Ugh single-origin coffee four loko, tote bag chartreuse skateboard disrupt truffaut cold-pressed deep v master cleanse mlkshk pop-up gluten-free yuccie. Bespoke pour-over four dollar toast health goth mustache, pabst whatever meh yuccie ugh meggings. Readymade tote bag tousled marfa, franzen sartorial keffiyeh cray tacos actually. Helvetica photo booth tumblr portland bespoke, pickled fap PBR&B raw denim. Yr seitan cronut neutra, taxidermy direct trade biodiesel helvetica. Before they sold out fixie pork belly, helvetica trust fund paleo craft beer swag marfa forage offal cronut. Paleo aesthetic chartreuse four loko ethical everyday carry, blue bottle tilde echo park direct trade."
)
Meeting.create(
  name: "Wireframe designing",
  address: "222 W Merchandise Mart Plaza, Chicago, IL 60654",
  start_time: DateTime.new(2016, 4, 27, 14),
  end_time: DateTime.new(2016, 4, 27, 15),
  notes: "Mumblecore kombucha irony direct trade. Kitsch affogato cardigan tumblr before they sold out. Tousled cornhole leggings, intelligentsia chartreuse williamsburg food truck mlkshk heirloom pickled deep v occupy readymade. Kitsch put a bird on it cray literally, chicharrones vegan waistcoat lumbersexual hammock brooklyn etsy bushwick celiac narwhal. Gastropub twee leggings celiac vegan. Whatever kitsch literally selfies marfa. Butcher beard food truck narwhal bespoke."
)
Meeting.create(
  name: "Dentist appointment",
  address: "567 W Kinzie St, Chicago, IL 60654",
  start_time: DateTime.new(2016, 4, 27, 9),
  end_time: DateTime.new(2016, 4, 27, 11),
  notes: "Pinterest man bun intelligentsia, kombucha chia keffiyeh cray single-origin coffee swag truffaut iPhone viral seitan plaid. Sriracha photo booth literally microdosing tousled. Humblebrag crucifix brunch, neutra gentrify pour-over gastropub vinyl 90's umami literally. Church-key leggings pop-up bicycle rights humblebrag. Food truck sriracha put a bird on it chambray typewriter. Echo park mumblecore single-origin coffee, taxidermy four dollar toast keytar sustainable gochujang franzen everyday carry venmo man braid. Listicle tote bag YOLO stumptown franzen, post-ironic church-key chartreuse single-origin coffee."
)
Meeting.create(
  name: "Prototype presentation",
  address: "222 W Merchandise Mart Plaza, Chicago, IL 60654",
  start_time: DateTime.new(2016, 5, 10, 14),
  end_time: DateTime.new(2016, 5, 10, 15),
  notes: "Wayfarers tumblr etsy meh kale chips scenester, godard yr blue bottle sartorial before they sold out. Kale chips franzen vinyl, put a bird on it blue bottle street art before they sold out cronut man bun umami kogi authentic sustainable cornhole 3 wolf moon. Knausgaard 90's man braid, XOXO yuccie brunch crucifix butcher sartorial fashion axe neutra kickstarter. Street art cronut hoodie flannel cred aesthetic, banjo retro mlkshk trust fund cold-pressed. Semiotics vegan umami, poutine man bun quinoa hella squid lumbersexual gochujang fingerstache stumptown meggings. Humblebrag beard food truck post-ironic bitters art party. Photo booth cornhole kitsch, put a bird on it banh mi hoodie keytar ramps."
)

Tag.create(
  name: "Work"
)
Tag.create(
  name: "Client"
)
Tag.create(
  name: "Personal"
)

MeetingTag.create(
  meeting_id: 1,
  tag_id: 1
)
MeetingTag.create(
  meeting_id: 1,
  tag_id: 2
)
MeetingTag.create(
  meeting_id: 2,
  tag_id: 1
)
MeetingTag.create(
  meeting_id: 3,
  tag_id: 3
)
MeetingTag.create(
  meeting_id: 4,
  tag_id: 1
)
MeetingTag.create(
  meeting_id: 4,
  tag_id: 2
)
