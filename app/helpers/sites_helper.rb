
module SitesHelper
  def area83_site_links
    {
      "Area 83 Eastern Ontario" => "http://area83aa.org/",
      "District 30 Quinte West" => "http://www.quintewestaa.org",
      "District 36 Kingston & The Islands"  => "http://www.kingstonaa.org",
      "Greater Toronto Area InterGroup" => "http://aatoronto.org/",
      "Oshawa Lake Shore InterGroup" => "http://www.aaoshawa.org/",
      "Ottawa Area Intergroup" => "http://www.ottawaaa.org/",
      "District 86 Kawartha" => "http://www.peterboroughaa.org/",
      "District 66 The Golden Triangle" => "http://www.lanarkleedsaa.org/",
      "District 74 Pembroke" => "http://www.pembrokeaa.org/",
      "District 78 Madawaska Valley" => "http://aamadawaskavalley.org/",
      "District 42 St. Lawrence International" => "http://aa-stlawrenceny.org/"
    }
  end

  def aa_site_links
    {
      "World Service Organization" => "http://www.aa.org/",
      "AA Grapevine" => "http://www.aagrapevine.org/"
    }
  end

  def sites_get_class(key, links)
    last_key = links.to_a.last[0]
    class_str = "small-12 medium-6 large-4 content-columns"
    class_str += " end" if key == last_key
    return class_str
  end
end
