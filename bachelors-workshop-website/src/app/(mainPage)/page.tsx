import Image from "next/image";

export default function Home() {
    return (
        <div className="h-screen text-white bg-black size">
            <main className="flex flex-col gap-20 justify-center content-center self-center my-auto h-5/6">
                <Image
                    className="self-center invert"
                    src="https://nextjs.org/icons/next.svg"
                    alt="Next.js logo"
                    width={180}
                    height={38}
                    priority
                    style={{ color: "white" }}
                />
                <ol className="flex flex-col self-center list-disc list-inside">
                    <li className="">
                        Get started by editing{" "}
                        <code className="font-mono">src/app/page.tsx</code>.
                    </li>
                    <li>Save and see your changes instantly.</li>
                </ol>

                <div className="self-center">
                    <a
                        href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="p-5 bg-transparent rounded-full border-2 border-white transition-all hover:border-teal-200 hover:text-black"
                        style={{
                            textShadow: "0 0 3px white",
                        }}
                    >
                        Read the docs :D
                    </a>
                </div>
            </main>
            <footer
                className="*:flex *:gap-2 *:items-center flex flex-row gap-6 self-end"
                style={{ marginTop: "5%" }}
            >
                <a
                    href="https://nextjs.org/learn?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    <Image
                        aria-hidden
                        src="https://nextjs.org/icons/file.svg"
                        alt="File icon"
                        width={16}
                        height={16}
                    />
                    Learn
                </a>
                <a
                    href="https://vercel.com/templates?framework=next.js&utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    <Image
                        aria-hidden
                        src="https://nextjs.org/icons/window.svg"
                        alt="Window icon"
                        width={16}
                        height={16}
                    />
                    Examples
                </a>
                <a
                    href="https://nextjs.org?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    <Image
                        aria-hidden
                        src="https://nextjs.org/icons/globe.svg"
                        alt="Globe icon"
                        width={16}
                        height={16}
                    />
                    Go to nextjs.org →
                </a>
            </footer>
        </div>
    );
}
