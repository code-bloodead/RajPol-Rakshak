export const randomColors = ["red", "green", "blue", "yellow"];

export function getColor(id: number) {
  return randomColors[id % randomColors.length];
}

export const WeaponColorMap: Record<string, string> = {
  Knife: "red",
  Gun: "black",
  Other: "blue",
};
export function getWeaponColor(weaponLabel: string) {
  return WeaponColorMap[weaponLabel] || WeaponColorMap.Other;
}
