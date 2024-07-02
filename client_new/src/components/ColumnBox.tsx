import { Item } from "../types";



export const ColumnBox = ({
    title,
    items,
    classes
}: Readonly<{
    title: string;
    items: Item[];
    classes?: string
}>) => {
    console.log("items: ", items);
    console.log("title: ", title)
    return (
        <div className="w-full">
            <h1 className={`text-xl font-bold p-4 ${classes}`}>{title}</h1>
            <ul className="flex flex-col gap-4 border p-8 list-disc bg-slate-50 h-full">
                {items?.length && items.map((item) => (
                    <li className="flex items-center" key={item.details}>
                        {item.details} 
                        <div className="ml-4 border w-40 h-3 bg-white">
                            <div style={{width: `${item.weight}%`}} className="p-1 flex items-center justify-center h-full bg-slate-500 text-white text-bold text-xs" />
                        </div>
                        <div className="pl-4">{item.weight}</div>
                    </li>
                ))}
            </ul>
        </div>
    
    );
}
