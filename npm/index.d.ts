declare module '@apiverve/randomgenerator' {
  export interface randomgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface randomgeneratorResponse {
    status: string;
    error: string | null;
    data: RandomDataGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface RandomDataGeneratorData {
      type:  null | string;
      count: number | null;
      data:  (null | string)[];
  }

  export default class randomgeneratorWrapper {
    constructor(options: randomgeneratorOptions);

    execute(callback: (error: any, data: randomgeneratorResponse | null) => void): Promise<randomgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: randomgeneratorResponse | null) => void): Promise<randomgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<randomgeneratorResponse>;
  }
}
