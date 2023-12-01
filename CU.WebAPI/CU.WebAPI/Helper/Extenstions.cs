using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Helper
{
    public static class Extenstions
    {
        #region exception
        // all error checking left out for brevity
        // a.k.a., linked list style enumerator
        private static IEnumerable<TSource> FromHierarchy<TSource>(
            this TSource source,
            Func<TSource, TSource> nextItem,
            Func<TSource, bool> canContinue)
        {
            for (var current = source; canContinue(current); current = nextItem(current))
            {
                yield return current;
            }
        }

        private static IEnumerable<TSource> FromHierarchy<TSource>(
            this TSource source,
            Func<TSource, TSource> nextItem)
            where TSource : class
        {
            return FromHierarchy(source, nextItem, s => s != null);
        }

        public static string GetAllMessages(this Exception exception)
        {
            var messages = exception.FromHierarchy(ex => ex.InnerException)
                .Select(ex => ex.Message);
            return string.Join($"\nInner Exception -> ", messages);
        }
        #endregion

        #region datatable to list
        public static List<T> ToList<T>(this DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }
        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();
            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (System.Reflection.PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                    {
                        try
                        {
                            object value = dr[column.ColumnName] == DBNull.Value ? null : dr[column.ColumnName];
                            pro.SetValue(obj, value, null);
                        }
                        catch { }
                        break;
                    }
                }
            }
            return obj;
        }
        #endregion
    }
}