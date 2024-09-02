import { useState } from "react";
import { Button } from '@chakra-ui/react'
import { Item } from "../types";
import Modal from '../components/Modal';


export const ColumnBox = ({
    name,
    items,
    classes,
    modalContent,
    onSave
}: Readonly<{
    name: string;
    items: Item[];
    classes?: string,
    modalContent?: React.ReactNode,
    onSave?: () => void
}>) => {
    const [isModalOpen, setIsModalOpen] = useState(false);

    return (
        <div className="w-full">
            <h1 className={`text-xl font-bold p-4 ${classes}`}>{name}s <Button onClick={() => setIsModalOpen(true)} className="ml-4">Add</Button> </h1>
            <ul className="flex flex-col gap-4 border p-8 list-disc bg-slate-50 h-full">
                {items?.length && items.map((item) => (
                    <li className="flex items-center" key={item.description}>
                        {item.description} 
                        <div className="ml-4 border w-40 h-3 bg-white">
                            <div style={{width: `${item.weight}%`}} className="p-1 flex items-center justify-center h-full bg-slate-500 text-white text-bold text-xs" />
                        </div>
                        <div className="pl-4">{item.weight}</div>
                    </li>
                ))}
            </ul>
            <Modal 
              isOpen={isModalOpen} 
              onClose={() => setIsModalOpen(false)} 
              title={`Add ${name}`} 
              content={modalContent}
              onSave={onSave}
            />
        </div>
    );
}
