declare module '@apiverve/randomgenerator' {
  export interface randomgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface randomgeneratorResponse {
    status: string;
    error: string | null;
    data: RandomDataGeneratorData;
    code?: number;
  }


  interface RandomDataGeneratorData {
      type:  string;
      count: number;
      data:  string[];
  }

  export default class randomgeneratorWrapper {
    constructor(options: randomgeneratorOptions);

    execute(callback: (error: any, data: randomgeneratorResponse | null) => void): Promise<randomgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: randomgeneratorResponse | null) => void): Promise<randomgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<randomgeneratorResponse>;
  }
}
