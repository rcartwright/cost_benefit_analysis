export interface Item {
  description: string;
  weight: number;
}

export interface Analysis {
  description: string;
  name: string;
  costs: Item[];
  benefits: Item[];
}

export type Data = {
  data: Analysis[]
}
