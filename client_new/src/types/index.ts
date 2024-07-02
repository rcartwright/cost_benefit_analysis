export interface Item {
  details: string;
  weight: number;
}

export interface Analysis {
  description: string;
  name: string;
  costs: Item[];
  benefits: Item[];
}
