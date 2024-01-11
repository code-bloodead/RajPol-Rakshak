import { LocationSuggestion } from "../../../components/SearchDialog";
import { LocationTypes } from "../../../components/SearchDialog/locationType";
import geoJson from "./cctvs.json";
import { CctvDetails } from "./cctvs.types";

// interface LocationProperty {
//   title: string;
//   description: string;
// }
// interface LocationGeometry {
//   coordinates: number[];
//   type: string;
// }
// interface LocationFeature {
//   type: string;
//   properties: LocationProperty;
//   geometry: LocationGeometry;
// }
// interface CCTV_COORDINATES {
//   features: LocationFeature[];
// }

export function getDefaultMapCenter(): {
  lat: number;
  lon: number;
} {
  return {
    lat: 19.116625,
    lon: 72.862358,
  };
}
export async function getCctvs(): Promise<CctvDetails[]> {
  // const response = await axios.get('/api/cctvs');
  // return response.data;

  return geoJson.features.map((feature) => {
    return {
      id: feature.properties.id,
      cctv_type: feature.properties.cctv_type,
      name: feature.properties.title,
      description: feature.properties.description,
      latitude: feature.geometry.coordinates[1],
      longitude: feature.geometry.coordinates[0],
      streamUrl: feature.properties.streamUrl,
    };
  });
}

export async function getLocationSuggestions(
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  text: string
): Promise<LocationSuggestion[]> {
  // console.log("Search text: ", text);

  return [
    {
      name: geoJson.features[0].properties.title,
      lon: geoJson.features[0].geometry.coordinates[0],
      lat: geoJson.features[0].geometry.coordinates[1],
      type: geoJson.features[0].properties.kind as LocationTypes,
    },
    {
      name: geoJson.features[1].properties.title,
      lon: geoJson.features[1].geometry.coordinates[0],
      lat: geoJson.features[1].geometry.coordinates[1],
      type: geoJson.features[1].properties.kind as LocationTypes,
    },
    {
      name: geoJson.features[2].properties.title,
      lon: geoJson.features[2].geometry.coordinates[0],
      lat: geoJson.features[2].geometry.coordinates[1],
      type: geoJson.features[2].properties.kind as LocationTypes,
    },
  ];
}
