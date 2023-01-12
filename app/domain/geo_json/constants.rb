# frozen_string_literal: true

# Module used to store constants for geo json generation
module GeoJson::Constants
  PROTECTED_AREA_NAME_TO_MODEL =
    {
      'Natura2000 BAST' => Bast,
      'Natura2000 PAST' => Past,
      'Rezervatas' => Rezervatas,
      'Draustinis' => Draustinis,
      'Geologiniai Gpo' => GeologiniaiGpoPlotiniai,
      'Hidrografiniai Gpo' => HidrografiniaiGpoPlotiniai,
      'Geomorfologiniai Gpo' => GeomorfologiniaiGpoPlotiniai,
      'Hidrogeologiniai Gpo' => HidrogeologiniaiGpoPlotiniai,
      'Botaniniai Gpo' => BotaniniaiGpoPlotiniai,
      'Zoologiniai Gpo' => ZoologiniaiGpoPlotiniai,
      'STK Sklypai' => StkSklypai,
      'STK Parkai' => StkParkai,
      'Biosferos Rezervatai' => BiosferosRezervatai,
      'Biosferos Poligonai' => BiosferosPoligonai,
      'Funkcinio Prioriteto Zonos' => FunkcinioPrioritetoZonos,
      'Buferines Apsaugos Zonos' => BuferinesApsaugosZonos
    }.freeze
end
