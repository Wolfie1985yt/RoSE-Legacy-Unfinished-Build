package backend;

class MacroData
{
    public static macro function getDate()
        return macro  $v{Date.now().toString()};
}
