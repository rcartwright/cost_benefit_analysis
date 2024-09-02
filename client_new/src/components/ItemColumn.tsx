import { Button } from '@chakra-ui/react'
import { useDisclosure } from '@chakra-ui/react';
import { Item } from "../types";

export const ItemColumn = ({
    name,
    items,
    classes,
    itemModal
}: Readonly<{
    name: string;
    items: Item[];
    classes?: string,
    itemModal?: (onClose: () => void, isOpen: boolean) => JSX.Element
}>) => {
    const { isOpen, onOpen, onClose } = useDisclosure();

    return (
        <div className="w-full">
            <h1 className={`text-xl font-bold p-4 ${classes}`}>{name}s <Button onClick={onOpen} className="ml-4">Add</Button> </h1>
            <ul className="flex flex-col gap-4 border p-8 list-disc bg-slate-50 h-full">
                {items?.length && items.map((item, index) => (
                    <li className="flex items-center" key={`${item.description}-${index}`}>
                        {item.description} 
                        <div className="ml-4 border w-40 h-3 bg-white">
                            <div style={{width: `${item.weight}%`}} className="p-1 flex items-center justify-center h-full bg-slate-500 text-white text-bold text-xs" />
                        </div>
                        <div className="pl-4">{item.weight}</div>
                    </li>
                ))}
            </ul>
            {itemModal && itemModal(onClose, isOpen)}
        </div>
    );
}
