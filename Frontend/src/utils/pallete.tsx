export const randomColors = ["green", "blue", "brown", "violet"];

export function getColor(id: number) {
  return randomColors[id % randomColors.length];
}

export const WeaponColorMap: Record<string, string> = {
  Knife: "brown",
  Gun: "black",
  Other: "gray",
};
export function getWeaponColor(weaponLabel: string) {
  return WeaponColorMap[weaponLabel] || WeaponColorMap.Other;
}

export const ACCIDENT_COLOR = "red";
export const FIRE_COLOR = "#370088";
export const CLIMBER_COLOR = "#005b18";

// export const ClimberColorMap: Record<string, string> = {
//   climber: "red",
//   walker: "gray",
//   Other: "gray",
// };
// export function getClimberColor(climberLabel: string) {
//   return ClimberColorMap[climberLabel] || ClimberColorMap.Other;
// }