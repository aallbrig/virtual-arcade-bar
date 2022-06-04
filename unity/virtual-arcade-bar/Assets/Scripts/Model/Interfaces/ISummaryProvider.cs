namespace Model.Interfaces
{
    public interface ISummaryProvider
    {
        string EntityType { get; }
        string EntityName { get; }
    }
}