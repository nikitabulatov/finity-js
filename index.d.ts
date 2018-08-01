declare module 'finity-js' {
  export function diff(date1: Date, date2: Date, abs?: boolean): number
  export function daysInMonth(date: Date): number
  export function addDays(date: Date, days: number): Date
  export function addMonths(date: Date, months: number): Date
  export function addYears(date: Date, years: number): Date
  export function getDatesRange(date1: Date, date2: Date): Date[]
  export function getDatesMonthRange(date1: Date, date2: Date): Date[]
  export function isLeap(date: Date): boolean
  export function isEqualMonths(date1: Date, date2: Date): boolean
  export function isEqualDates(date1: Date, date2: Date): boolean
  export function isEqual(date1: Date, date2: Date, deep?: 'day' | 'year' | 'hour' | 'minute' | 'second'): boolean
  export function lastMonthDate(date: Date): Date
  export function isDateInRange(date: Date, min: Date, max: Date): boolean
  export function getMonthDates(date: Date): Date[]
  export function setLocale(locale: object): void
  export function getCurrentLocale(): object
  export function format(date: Date, format: string, genitive?: boolean, locale?: object): string
  export function parse(str: string, format: string | string[], locale?: object): Date
  export function utc(date: Date): Date
  export function dayOfYear(date: Date): number
}
