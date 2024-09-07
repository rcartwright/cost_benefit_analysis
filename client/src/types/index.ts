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

export type AlertProps = {
  title?: string;
  description?: string;
  status?: 'info' | 'warning' | 'success' | 'error';
} | null;
