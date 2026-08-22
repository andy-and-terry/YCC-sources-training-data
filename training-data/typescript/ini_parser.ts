type IniData = Record<string, Record<string, string>>;

function parseIni(text: string): IniData {
  const result: IniData = {};
  let section: string | null = null;
  for (let line of text.split('\n')) {
    line = line.trim();
    if (!line || line.startsWith('#') || line.startsWith(';')) continue;
    if (line.startsWith('[') && line.endsWith(']')) {
      section = line.slice(1, -1);
      result[section] = {};
    } else if (line.includes('=') && section !== null) {
      const [key, ...rest] = line.split('=');
      result[section][key.trim()] = rest.join('=').trim();
    }
  }
  return result;
}

const sample = `
[server]
host = localhost
port = 8080
`;
console.log(parseIni(sample));
